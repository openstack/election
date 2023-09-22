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
import os
import pytz

from openstack_election import utils

counts = {'projects': 0, 'nominations': 0, 'with_candidate': 0, 'tc': 0, }
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


def collect_project_stats(basedir, verbose, projects):
    global counts

    for directory, dirnames, filenames in sorted(os.walk(basedir)):
        project = directory[len(basedir):]

        if project in projects:
            if verbose:
                print('Adding manual entry for project: %s' % (project))
            filenames = ['fake@placeholder']

        candidates = list(filter(lambda x: '@' in x, filenames))
        candidates_count = len(candidates)

        if project == "TC":
            counts['tc'] = candidates_count
        else:
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
                    print("%-25s : (%d) %s" % (project, len(candidates),
                                               ', '.join(candidates)))


def election_summary():
    now = datetime.datetime.now(tz=pytz.utc)
    now = now.replace(microsecond=0)
    event = utils.get_event('PTL Nominations')
    start, end = event['start'], event['end']
    duration = (end - start)
    remaining = (end - now)
    progress = (duration - remaining)

    p_progress = as_percentage(progress.total_seconds(),
                               duration.total_seconds())
    p_candidate = as_percentage(counts['with_candidate'], counts['projects'])
    p_nominations = as_percentage(counts['nominations'], counts['projects'])

    election_type = utils.conf.get('election_type', '').lower()

    need_election.sort()
    without_candidate.sort()

    output = ""
    output += ("%-25s @ %s\n" % ("Nominations started", as_utctime(start)))
    output += ("%-25s @ %s\n" % ("Nominations end", as_utctime(end)))
    output += ("%-25s : %s\n" % ("Nominations duration", duration))
    output += ("%-25s : %s\n" % ("Nominations remaining", remaining))
    output += ("%-25s : %6.2f%%\n" % ("Nominations progress", p_progress))

    if election_type in ['ptl', 'combined']:
        output += ("-" * 51)
        output += ("\n")
        output += ("%-25s : %5d\n" % ("Projects[1]", counts['projects']))
        output += ("%-25s : %5d (%6.2f%%)\n" % ("Projects with candidates",
                                                counts['with_candidate'],
                                                p_candidate))
        output += ("%-25s : %5d (%6.2f%%)\n" % ("Projects with election",
                                                counts['nominations'],
                                                p_nominations))
        output += ("-" * 51)
        output += ("\n")
        output += ("%-25s : %d (%s)\n" % ("Need election",
                                          len(need_election),
                                          " ".join(need_election)))
        output += ("%-25s : %d (%s)\n" % ("Need appointment",
                                          len(without_candidate),
                                          " ".join(without_candidate)))

    if election_type in ['tc', 'combined']:
        output += ("-" * 51)
        output += ("\n")
        output += ("%-25s : %d (%d Required)\n" % ("TC Candidates",
                                                   counts['tc'],
                                                   utils.conf['tc_seats']))
    output += ("=" * 51)
    output += ("\n")
    output += ("%-25s @ %s\n" % ("Stats gathered", as_utctime(now)))

    return output


def main():
    parser = argparse.ArgumentParser(description='Investigate PTL Nominations')
    parser.add_argument('-v', '--verbose', action="count", default=0,
                        help='Increase program verbosity')
    parser.add_argument('-r', '--release', default=utils.conf['release'],
                        help='Which nominations to look at')
    parser.add_argument('-b', '--basedir',
                        default=os.getcwd(),
                        help='Path to git clone of openstack/election')
    parser.add_argument('--projects', dest='projects', nargs='+',
                        default=[],
                        help=('These projects have candidates that are '
                              'validated by one election but not yet'
                              'approved'))

    args = parser.parse_args()
    args.basedir = os.path.join(args.basedir, 'candidates', args.release, '')
    args.basedir = os.path.expanduser(args.basedir)
    collect_project_stats(args.basedir, args.verbose, args.projects)

    if args.verbose:
        print("-" * 51)
    print(election_summary())
    print("")
    print("[1] These numbers include the following projects that have a "
          "candidate that is approved my only a single election official:"
          "\n\t%s\n" % (" ".join(args.projects)))
    return 0
