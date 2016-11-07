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
import os
import pytz

from openstack_election import utils

counts = {'projects': 0, 'nominations': 0, 'with_candidate': 0}
need_election = []
without_candidate = []


def as_percentage(progress, total):
    try:
        p = (100.0 * (float(progress) / float(total)))
    except ZeroDivisionError:
        p = 0.0
    return p


def as_utctime(dt):
    return "%s" % (dt.strftime("%Y-%m-%d %T UTC"))


def collect_project_stats(basedir, verbose):
    global counts

    for directory, dirnames, filenames in os.walk(basedir):
        project = directory[len(basedir):]
        if project == "TC":
            continue
        candidates = filter(lambda x: x.endswith('.txt'), filenames)
        candidates_count = len(candidates)

        if not filenames == []:
            counts['projects'] += 1
            if candidates_count != 0:
                counts['with_candidate'] += 1
            else:
                without_candidate.append(project)
            if candidates_count >= 2:
                counts['nominations'] += 1
                need_election.append(project)

            if verbose:
                print("%-25s : %s" % (project, candidates))


def main():
    parser = argparse.ArgumentParser(description='Investigate Nominations')
    parser.add_argument('-v', '--verbose', action="count", default=0,
                        help='Increase program verbosity')
    parser.add_argument('-r', '--release', default=utils.conf['release'],
                        help='Which nominations to look at')
    parser.add_argument('-b', '--basedir',
                        default=os.getcwd(),
                        help='Path to git clone of openstack/election')

    args = parser.parse_args()

    args.basedir = os.path.join(args.basedir, 'candidates', args.release, '')
    args.basedir = os.path.expanduser(args.basedir)
    collect_project_stats(args.basedir, args.verbose)

    now = datetime.datetime.now(tz=pytz.utc)
    now = now.replace(microsecond=0)
    start = utils.get_event('PTL nomination starts')
    end = utils.get_event('PTL nomination ends')
    duration = (end - start)
    remaining = (end - now)
    progress = (duration - remaining)

    p_progress = as_percentage(progress.total_seconds(),
                               duration.total_seconds())
    p_candidate = as_percentage(counts['with_candidate'], counts['projects'])
    p_nominations = as_percentage(counts['nominations'], counts['projects'])

    need_election.sort()
    without_candidate.sort()

    if args.verbose:
        print("-" * 51)
    print("%-25s @ %s" % ("Nominations started", as_utctime(start)))
    print("%-25s @ %s" % ("Nominations end", as_utctime(end)))
    print("%-25s : %s" % ("Nominations duration", duration))
    print("%-25s : %s" % ("Nominations remaining", remaining))
    print("%-25s : %6.2f%%" % ("Nominations progress", p_progress))
    print("-" * 51)
    print("%-25s : %5d" % ("Projects", counts['projects']))
    print("%-25s : %5d (%6.2f%%)" % ("Projects with candidates",
                                     counts['with_candidate'],
                                     p_candidate))
    print("%-25s : %5d (%6.2f%%)" % ("Projects with election",
                                     counts['nominations'],
                                     p_nominations))
    print("-" * 51)
    print("%-25s : %d (%s)" % ("Need election", len(need_election),
                               " ".join(need_election)))
    print("%-25s : %d (%s)" % ("Need appointment", len(without_candidate),
                               " ".join(without_candidate)))
    print("=" * 51)
    print("%-25s @ %s" % ("Stats gathered", as_utctime(now)))
