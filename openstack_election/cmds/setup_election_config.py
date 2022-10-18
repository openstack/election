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

ONE_WEEK = datetime.timedelta(weeks=1)
election_parameters = {
    'PTL': {
        'milestone': 'Release',
        'weeks_prior': 3,
        'events': ['Election', 'Nominations', ],
    },
    'TC': {
        'milestone': 'Release',
        'weeks_prior': 4,
        'events': ['Election', 'Campaigning', 'Nominations', ],
    },
    'combined': {
        'milestone': 'Release',
        'weeks_prior': 4,
        'events': ['Election', 'Campaigning', 'Nominations'],
    },
}


def _dict_representer(dumper, data):
    return dumper.represent_dict(data.items())


def valid_date(opt):
    try:
        d = datetime.datetime.strptime(opt, "%Y-%m-%d")
    except ValueError:
        msg = "Not a valid date: '{0}'.".format(opt)
        raise argparse.ArgumentTypeError(msg)
    return d.replace(tzinfo=pytz.UTC)


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
    # As per current charter(2021-07-21):
    # - PTL election needs to be held(start and end) on or before R-3 week
    # - TC election needs to be held(start and end) in between of R-6 to R-4
    # week.
    for week in release_schedule.get('cycle', []):
        if election_type == 'PTL':
            expected_start_date = datetime.datetime.strptime(
                        str(release_schedule['start-week']),
                        "%Y-%m-%d").replace(tzinfo=pytz.UTC)
            if week.get('name') == 'R-3':
                expected_end_date = datetime.datetime.strptime(
                        week['end'], "%Y-%m-%d").replace(tzinfo=pytz.UTC)
                break
        else:
            if week.get('name') == 'R-6':
                expected_start_date = datetime.datetime.strptime(
                        week['start'], "%Y-%m-%d").replace(tzinfo=pytz.UTC)
            if week.get('name') == 'R-4':
                expected_end_date = datetime.datetime.strptime(
                        week['end'], "%Y-%m-%d").replace(tzinfo=pytz.UTC)
    if (selected_start < expected_start_date or
            selected_end > expected_end_date):
        print("Error: generated start and end date as per given dates in\n"
              "       parameter is not matching with the TC charter,\n"
              "       please select the release date correctly.")
        exit(1)


def select_release_end_date(release_schedule):
    date = None
    for week in release_schedule.get('cycle', []):
        if 'x-final' in week.get('x-project', {}):
            date = datetime.datetime.strptime(
                       week['end'],
                       "%Y-%m-%d").replace(tzinfo=pytz.UTC)
    return date


def main():
    parser = argparse.ArgumentParser(description=('Given a release '
                                                  'date pick some dates for '
                                                  'the election'))
    parser.add_argument('release', help='release name')
    parser.add_argument('type', choices=['TC', 'PTL', 'combined'])
    parser.add_argument('--tc-seats', default=4, choices=['4', '5'],
                        help='number of TC seats up for election')
    # If date is not passed in command line then, this script will
    # automatically pick the release end date.
    parser.add_argument('--date', default=None, type=valid_date,
                        help='Date from release schedule in the form '
                             'YYYY-MM-DD')

    args = parser.parse_args()
    args.release = args.release.lower()

    params = election_parameters[args.type]
    offset = datetime.timedelta(weeks=params['weeks_prior'])

    # We need to know the releases in order.  Fortunately this data exists
    # in the releases repo in a really easy format to understand.
    series_data = utils.get_series_data()
    names = [x['name'].lower() for x in series_data]
    # Find where in the list the requested release sits.  This will typically
    # be very early but don't assume that.
    idx = names.index(args.release) if args.release in names else -1

    # If date is not passed to this script then autimatically
    # select the release end date.
    if (args.date is None):
        schedule = utils.get_schedule_data(names[idx+1])
        args.date = select_release_end_date(schedule)
        if args.date is None:
            print("Error: no end date found in series data")
            exit(1)

    # Given the release history:
    #  Stein, Rocky[0], Queens[1], Pike[2], Ocata[3]
    # For the Stein elections candidates come from the previous 2 cycles so:
    #   Rocky and Queens.
    timeframe_name = '%s-%s' % (names[idx+2].capitalize(),
                                names[idx+1].capitalize())

    # The Queens development cycle begins when we branch Pike-RC1, so collect
    # that date from the releases data.
    schedule = utils.get_schedule_data(names[idx+3])
    event = '%s-rc1' % (names[idx+3][0:1])
    for week in schedule.get('cycle', []):
        if event in week.get('x-project', {}):
            timeframe_start = datetime.datetime.strptime(week['end'],
                                                         "%Y-%m-%d")
    timeframe_start = timeframe_start.replace(tzinfo=pytz.UTC)

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
        if args.type == 'combined':
            if event == 'Campaigning':
                name = 'TC %s' % event
            else:
                name = 'TC & PTL %s' % event
        else:
            name = '%s %s' % (args.type, event)
        start = end - ONE_WEEK
        if event == 'Election':
            schedule = utils.get_schedule_data(names[idx+1])
            validate_tc_charter(args.type, schedule, start, end)
        events.insert(0, OrderedDict(name=name,
                                     start=iso_fmt(start),
                                     end=iso_fmt(end)))
        print('%s from %s to %s' % (name, iso_fmt(start), iso_fmt(end)))
        # For a TC or combined election we want the email deadline to match the
        # beginning of the Campaigning period, which gives the officials time
        # to validate the rolls
        if args.type in ['TC', 'combined'] and event == 'Campaigning':
            email_deadline = start.replace(hour=0, minute=0)
        # Otherise for a PTL election we want to set the email deadline to the
        # begining of the Nomination period, agin to give officials time to
        # validate the rolls
        elif args.type == 'PTL' and event == 'Nominations':
            email_deadline = start.replace(hour=0, minute=0)
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

    print('Begining of %s Cycle @ %s' % (names[idx+2].capitalize(),
                                         timeframe_start))
    print('End of %s cycle @ %s' % (names[idx+1].capitalize(),
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
        release=args.release.lower(),
        election_type=args.type.lower(),
        tag=args.date.strftime('%b-%Y-elections').lower(),
        tc_seats=int(args.tc_seats),
        timeframe=OrderedDict(name=timeframe_name,
                              start=iso_fmt(timeframe_start),
                              end=iso_fmt(timeframe_end),
                              email_deadline=iso_fmt(email_deadline)
                              ),
        timeline=events,
    )
    yaml.Dumper.add_representer(OrderedDict, _dict_representer)
    print(yaml.dump(configuration, default_flow_style=False,
                    default_style='', explicit_start=True))

    return 0 if timeframe_span_ok else 1


if __name__ == '__main__':
    sys.exit(main())
