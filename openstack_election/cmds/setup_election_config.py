# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

import argparse
import datetime
import pytz
import sys
import yaml

from collections import OrderedDict

from openstack_election.config import ISO_FMT
from openstack_election import utils

MIN_NOMINATION_WEEKS = 2
MIN_VOTING_WEEKS = 2
MIN_CAMPAIGNING_WEEKS = 1
MIN_NOMINATION_PERIOD = datetime.timedelta(weeks=MIN_NOMINATION_WEEKS)
MIN_VOTING_PERIOD = datetime.timedelta(weeks=MIN_VOTING_WEEKS)
MIN_CAMPAIGNING_PERIOD = datetime.timedelta(weeks=MIN_CAMPAIGNING_WEEKS)

election_parameters = {
    'PTL': {
        'milestone': 'Release',
        'weeks_prior': 2,
        'events': ['Election', 'Nominations', ],
    },
    'TC': {
        'milestone': 'Release',
        'weeks_prior': 2,
        'events': ['Election', 'Campaigning', 'Nominations', ],
    },
    'combined': {
        'milestone': 'Release',
        'weeks_prior': 2,
        'events': ['Election', 'Campaigning', 'Nominations'],
    },
}


class IndentDumper(yaml.Dumper):
    def increase_indent(self, flow=False, indentless=False):
        return super().increase_indent(flow, False)


def _dict_representer(dumper, data):
    return dumper.represent_dict(data.items())


def valid_version(value):
    try:
        value = float(value)
    except ValueError:
        msg = ("{} is not an valid release version. Pass release version, for"
               " example 2023.1".format(value))
        raise Exception(msg)
    return value


def valid_date(opt):
    try:
        d = datetime.datetime.strptime(opt, "%Y-%m-%d")
    except ValueError:
        msg = "Not a valid date: '{0}'.".format(opt)
        raise argparse.ArgumentTypeError(msg)
    return d.replace(tzinfo=pytz.UTC)


def valid_nomination_period(period_opt):
    try:
        period = datetime.timedelta(weeks=int(period_opt))
    except ValueError:
        msg = "Not a valid number of weeks."
        raise argparse.ArgumentTypeError(msg)

    if period < MIN_NOMINATION_PERIOD:
        msg = "Minimum nomination period is {0} weeks ".format(
              MIN_NOMINATION_WEEKS)
        raise argparse.ArgumentTypeError(msg)
    return period


def valid_voting_period(period_opt):
    try:
        period = datetime.timedelta(weeks=int(period_opt))
    except ValueError:
        msg = "Not a valid number of weeks."
        raise argparse.ArgumentTypeError(msg)

    if period < MIN_VOTING_PERIOD:
        msg = "Minimum voting period is {0} weeks ".format(MIN_VOTING_WEEKS)
        raise argparse.ArgumentTypeError(msg)
    return period


def valid_campaigning_period(period_opt):
    try:
        period = datetime.timedelta(weeks=int(period_opt))
    except ValueError:
        msg = "Not a valid number of weeks."
        raise argparse.ArgumentTypeError(msg)

    if period < MIN_CAMPAIGNING_PERIOD:
        msg = "Minimum campaigning period is {0} weeks ".format(
            MIN_CAMPAIGNING_WEEKS)
        raise argparse.ArgumentTypeError(msg)
    return period


def find_previous_wednesday(date):
    # The are smarter ways to do this
    while date.weekday() != 2:
        date -= datetime.timedelta(days=1)
    return date


def iso_fmt(d):
    return d.strftime(ISO_FMT)


def validate_tc_charter(election_type, release_schedule,
                        selected_start, selected_end):
    # NOTE (gmann): This function will validate the selected start and
    # end date by this script against what TC charter says.
    # As per the translation from current charter(as of 2023-03-03):
    # - PTL election needs to be held(start and end) on or before R-2 week
    # - TC election needs to be held(start and end) in between of R-8 to R-2
    # week.
    expected_start_date = 0
    expected_end_date = 0
    for week in release_schedule.get('cycle', []):
        if election_type == 'PTL':
            expected_start_date = datetime.datetime.strptime(
                        str(release_schedule['start-week']),
                        "%Y-%m-%d").replace(tzinfo=pytz.UTC)
        else:
            if week.get('name') == 'R-8':
                expected_start_date = datetime.datetime.strptime(
                        week['start'], "%Y-%m-%d").replace(tzinfo=pytz.UTC)
        if week.get('name') == 'R-2':
            expected_end_date = datetime.datetime.strptime(
                    week['end'], "%Y-%m-%d").replace(tzinfo=pytz.UTC)
        if expected_start_date and expected_end_date:
            break
    if (selected_start < expected_start_date or
            selected_end > expected_end_date):
        print("Error: generated start and end date as per given dates in\n"
              "       parameter is not matching with the TC charter,\n"
              "       please select the release date correctly.")
        exit(1)


def select_release_end_date(release_name, release_schedule):
    date = None
    event = '%s-final' % (release_name[0:1])
    for week in release_schedule.get('cycle', []):
        if event in week.get('x-project', []):
            date = valid_date(week['end'])
    return date


def main():
    parser = argparse.ArgumentParser(description=('Given a release '
                                                  'date pick some dates for '
                                                  'the election'))
    parser.add_argument('release', type=valid_version,
                        help='release version. Example 2023.2')
    parser.add_argument('type', choices=['TC', 'PTL', 'combined'])
    parser.add_argument('--tc-seats', default=4, choices=['4', '5'],
                        help='number of TC seats up for election')
    # If date is not passed in command line then, this script will
    # automatically pick the release end date.
    parser.add_argument('--date', default=None, type=valid_date,
                        help='Date from release schedule in the form '
                             'YYYY-MM-DD')
    parser.add_argument('--nomination-weeks', default=MIN_NOMINATION_PERIOD,
                        type=valid_nomination_period,
                        help='How long nomination period should be held. '
                             'Default value (week) is %s.' %
                             MIN_NOMINATION_WEEKS)
    parser.add_argument('--voting-weeks', default=MIN_VOTING_PERIOD,
                        type=valid_voting_period,
                        help='How long voting period should be held. '
                             'Default value (week) is %s.' %
                             MIN_VOTING_WEEKS)
    parser.add_argument('--campaigning-weeks', default=MIN_CAMPAIGNING_PERIOD,
                        type=valid_campaigning_period,
                        help='How long campaigning should be held. '
                             'Default value (week) is %s.' %
                             MIN_CAMPAIGNING_WEEKS)

    args = parser.parse_args()

    params = election_parameters[args.type]
    offset = datetime.timedelta(weeks=params['weeks_prior'])

    # We need to know the releases in order.  Fortunately this data exists
    # in the releases repo in a really easy format to understand.
    series_data = utils.get_series_data()
    # TODO(gmann): release versions (release-id) is introduced from 2023.1
    # (Antelope) cycle and before that we have only release 'name'. We fetch
    # last 3 release data here so until 2023.1 we can fecth release-ids and
    # rest with 'name'.
    # We will use release version for election tooling and release repo is not
    # yet fully moved to the release version so continue using the release
    # name to fetch the data from release repo.
    release_data = []
    names = []
    for x in series_data:
        names.append(x['name'])
        if 'release-id' in x:
            release_data.append(str(x['release-id']))
        else:
            release_data.append(x['name'])
    # Find where in the list the requested release sits.  This will typically
    # be very early but don't assume that.
    idx = (release_data.index(str(args.release)) if str(args.release)
           in release_data else -1)
    # If date is not passed to this script then autimatically
    # select the release end date.
    if (args.date is None):
        schedule = utils.get_schedule_data(names[idx+1])
        args.date = select_release_end_date(names[idx+1], schedule)
        if args.date is None:
            print("Error: no end date found in series data")
            exit(1)

    # Given the release history:
    #  Stein, Rocky[0], Queens[1], Pike[2], Ocata[3]
    # For the Stein elections candidates come from the previous 2 cycles so:
    #   Rocky and Queens.
    timeframe_name = '%s-%s' % (release_data[idx+2].capitalize(),
                                release_data[idx+1].capitalize())

    # The Queens development cycle begins when we branch Pike-RC1, so collect
    # that date from the releases data.
    schedule = utils.get_schedule_data(names[idx+3])
    event = '%s-rc1' % (names[idx+3][0:1])
    for week in schedule.get('cycle', []):
        if event in week.get('x-project', []):
            timeframe_start = valid_date(week['end'])

    print('Setting %s Election\n%s is at: %s' % (args.type,
                                                 params['milestone'],
                                                 args.date.date()))
    end = args.date - offset
    print('Latest possible completion is at: %s' % (end.date()))
    end = find_previous_wednesday(end)
    print('Moving back to Wednesday: %s' % (end.date()))

    end = end.replace(hour=23, minute=45)
    events = []
    for event in params['events']:
        e_types = [args.type]
        if args.type == 'combined':
            e_types = ['PTL', 'TC']
            if event == 'Campaigning':
                e_types = ['TC']
        if event == 'Campaigning':
            start = end - args.campaigning_weeks
        elif event == 'Nominations':
            start = end - args.nomination_weeks
        else:
            start = end - args.voting_weeks
        # For a TC or combined election we want the email deadline to match the
        # beginning of the Campaigning period, which gives the officials time
        # to validate the rolls
        if args.type in ['TC', 'combined'] and event == 'Campaigning':
            email_deadline = start.replace(hour=0, minute=0)
        # Otherwise for a PTL election we want to set the email deadline to the
        # begining of the Nomination period, again to give officials time to
        # validate the rolls
        elif args.type == 'PTL' and event == 'Nominations':
            email_deadline = start.replace(hour=0, minute=0)
        if event == 'Election':
            schedule = utils.get_schedule_data(names[idx+1])
            validate_tc_charter(args.type, schedule, start, end)
        for e_type in e_types:
            name = '%s %s' % (e_type, event)
            events.insert(0, OrderedDict(name=name,
                                         start=iso_fmt(start),
                                         end=iso_fmt(end)))
            print('%s from %s to %s' % (name, iso_fmt(start), iso_fmt(end)))
        end = start

    print('Set email_deadline to %s' % (iso_fmt(email_deadline)))

    if args.type == 'PTL':
        # For a PTL election we haven't closed the current cycle so we set the
        # timeframe right up to the beginning of the nomination period.
        print('Setting PTL timeframe end to email_deadline')
        timeframe_end = email_deadline
    else:
        # For a TC election we should have completed the previous cycle so grab
        # the release date for it.  It is however possible that the gap between
        # that release and the summit doesn't allow for an election.  In that
        # case we need to use the email_deadline for timeframe_end

        # Grab the rlease data and fromvert it to a datetime
        timeframe_end = series_data[idx+1]['initial-release']
        timeframe_end = datetime.datetime.combine(timeframe_end,
                                                  datetime.time(0, 0))
        timeframe_end = timeframe_end.replace(tzinfo=pytz.UTC)

        if timeframe_end < email_deadline:
            print('Setting TC timeframe end to %s Release date %s' %
                  (series_data[idx+1]['name'], iso_fmt(timeframe_end)))
        else:
            timeframe_end = email_deadline
            print('Setting TC timeframe end to email_deadline')

    print('Begining of %s Cycle @ %s' % (release_data[idx+2].capitalize(),
                                         timeframe_start))
    print('End of %s cycle @ %s' % (release_data[idx+1].capitalize(),
                                    timeframe_end))

    timeframe_span = timeframe_end - timeframe_start
    timeframe_span_ok = (datetime.timedelta(11*365/12) <=
                         timeframe_span <=
                         datetime.timedelta(13*365/12))
    print('Election timeframe: %ss' % (timeframe_span))

    if not timeframe_span_ok:
        print('Looks like election timespan is outside of \'normal\'')
        print('Minimum: %s' % (datetime.timedelta(11*365/12)))
        print('Current: %s' % (timeframe_span))
        print('Maximum: %s' % (datetime.timedelta(13*365/12)))

    configuration = OrderedDict(
        release=args.release,
        election_type=args.type.lower(),
        tag='to-be-released',
        tc_seats=int(args.tc_seats),
        timeframe=OrderedDict(name=timeframe_name,
                              start=iso_fmt(timeframe_start),
                              end=iso_fmt(timeframe_end),
                              email_deadline=iso_fmt(email_deadline)
                              ),
        timeline=events,
    )
    yaml.Dumper.add_representer(OrderedDict, _dict_representer)
    print(yaml.dump(configuration, Dumper=IndentDumper,
                    default_flow_style=False, default_style='',
                    explicit_start=True))

    return 0 if timeframe_span_ok else 1


if __name__ == '__main__':
    sys.exit(main())
