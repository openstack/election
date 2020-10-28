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
import os
import re

from openstack_election import utils


def set_TC_apointee(candidates_list, project, candidate):
    print('TC Appointee for %s (%s/%s/%s)' %
          (project, candidate['fullname'], candidate['ircname'],
           candidate['email']))
    candidates_list['candidates'][project] = [candidate]


def set_election_winner(candidates_list, project, idx):
    candidate = candidates_list['candidates'][project][idx]
    print('Setting %s PTL from election to (%s/%s/%s)' %
          (project, candidate['fullname'], candidate['ircname'],
           candidate['email']))
    candidates_list['candidates'][project] = [candidate]


def do_fixup(candidates_list, project, idx, key, value):
    old = candidates_list['candidates'][project][0][key]
    print('Fixing %s/%s(%d) changing %s to %s' %
          (project, key, idx, old, value))
    candidates_list['candidates'][project][0][key] = value


def load_candidates():
    print('Loading Candidates')
    candidates_list = utils.build_candidates_list()
    print('Done')
    return candidates_list


def load_projects(projects_fname):
    with open(projects_fname) as fh:
        data = fh.readlines()

    return data


def update_projects(projects_fname, candidates_list, projects):
    results = utils.get_ptl_results()
    project_count = 0
    with open(projects_fname, 'w') as fh:
        skip = 0
        for line in projects:
            if skip > 0:
                skip -= 1
                continue
            # Projects are detectable as they have no whitespace in column 0
            match = re.match('^([^ \t][^:]+?):$', line)
            if match:
                project_count += 1
                p = utils.name2dir(match.group(1))
                try:
                    candidates = candidates_list['candidates'][p]
                except KeyError:
                    # Add placeholder for required TC appointment in cases
                    # where there is no candidate
                    candidates = [{
                        'fullname': 'APPOINTMENT NEEDED',
                        'ircname': '',
                        'email': 'example@example.org',
                        }]
                    print('TC to appoint PTL for %s' % (p))
                nr_candidates = len(candidates)
                # Remove non-elected candidates if the election is closed
                # TODO(fungi): rework this entire function to just use the
                # election results file if we have one and not iterate over
                # the candidates tree
                if nr_candidates > 1:
                    for c1 in results['candidates'].get(p, []):
                        if not c1['elected']:
                            for c2 in list(candidates):
                                if c1['email'] == c2['email']:
                                    candidates.remove(c2)
                nr_candidates = len(candidates)
                # Only update the PTL if there is a single candidate
                if nr_candidates == 1:
                    # Replace empty IRC nick strings with something useful
                    if not candidates[0]['ircname']:
                        candidates[0]['ircname'] = 'No nick supplied'
                    line += (('  ptl:\n' +
                              '    name: %(fullname)s\n' +
                              '    irc: %(ircname)s\n' +
                              '    email: %(email)s\n') % (candidates[0]))
                    # This is a little fragile but the std. form is that the 4
                    # lines after the project name are the PTL details.  We've
                    # just written out new record so skip the next 4 lines in
                    # the projects file.
                    skip = 4
                else:
                    print('Skipping %s election in progress %d candidates' %
                          (p, nr_candidates))
            fh.write(line)

    print('Processed %d projects' % (project_count))


def main():
    description = ('Update openstack/gorernance:reference/projects.yaml '
                   ' with the new PTL details')
    parser = argparse.ArgumentParser(description)
    parser.add_argument('--governance-repo', dest='governance_repo',
                        required=True,
                        help=('Path to a clone of the governance repo'))

    args = parser.parse_args()
    projects_fname = os.path.join(os.path.expanduser(args.governance_repo),
                                  'reference', 'projects.yaml')
    projects = load_projects(projects_fname)
    candidates_list = load_candidates()
    update_projects(projects_fname, candidates_list, projects)
    return 0
