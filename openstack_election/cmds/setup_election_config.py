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

from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals

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
        'milestone': 'Summit',
        'weeks_prior': 6,
        'events': ['Election', 'Campaigning', 'Nominations', ],
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


def first_tuesday(date):
    # The are smarter ways to do this
    while date.weekday() != 1:
        date -= datetime.timedelta(days=1)
    return date


def iso_fmt(d):
    return d.strftime(ISO_FMT)


def main():
    parser = argparse.ArgumentParser(description=('Given a summit or release '
                                                  'date pick some dates for '
                                                  'the election'))
    # We can't rely on the current schedule being codified in the releases
    # repo so just get the date from the command line.
    parser.add_argument('date', type=valid_date)
    parser.add_argument('release')
    parser.add_argument('type', choices=['TC', 'PTL'])
    parser.add_argument('--tc-seats', default=6, choices=['6', '7'])

    args = parser.parse_args()
    args.date = args.date
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
    end = first_tuesday(end)
    print('Moving back to Tuesday: %s' % (end.date()))

    end = end.replace(hour=23, minute=45)
    events = []
    for event in params['events']:
        name = '%s %s' % (args.type, event)
        start = end - ONE_WEEK
        events.insert(0, OrderedDict(name=name,
                                     start=iso_fmt(start),
                                     end=iso_fmt(end)))
        print('%s from %s to %s' % (name, iso_fmt(start), iso_fmt(end)))
        # For a TC election we want the email deadline to match the beginning
        # of the Campaigning period, which gives the officials time to
        # validate the rolls
        if args.type == 'TC' and event == 'Campaigning':
            email_deadline = start.replace(hour=0, minute=0)
        # Otherise for a PTL election we want to set the email deadline to the
        # begining of the Nomination period, agin to give officials time to
        # validate the rolls
        elif args.type == 'PTL' and event == 'Nominations':
            email_deadline = start.replace(hour=0, minute=0)
        end = start

    print('Set email_deadline to %s' % (iso_fmt(email_deadline)))

    if args.type == 'PTL':
        # For a PTL election we haven't closed the current cycle so we set thew
        # timeframe right up to the begining of the nomination period.
        print('Setting PTL timeframe end to email_dedline')
        timeframe_end = email_deadline
    else:
        # For a TC election we have completed the previous cycle so grab the
        # release dat for it.
        timeframe_end = series_data[idx+1]['initial-release']
        timeframe_end = datetime.datetime.combine(timeframe_end,
                                                  datetime.time(0, 0))
        timeframe_end = timeframe_end.replace(tzinfo=pytz.UTC)
        print('Setting TC timeframe end to %s Release date %s' %
              (series_data[idx+1]['name'], iso_fmt(timeframe_end)))

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
        release=args.release,
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
