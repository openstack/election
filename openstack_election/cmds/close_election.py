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
import os
import yaml

from openstack_election import utils


def check_elected_candidate(candidates):
    for candidate in candidates:
        if candidate.get('elected'):
            return True
    return False


def process(db, round):
    dirty = False

    # Remove un-needed project
    if round == 'tc' and len(db['projects']) != 1:
        dirty = True
        db['projects'] = ['TC']
        db['candidates'] = {'TC': db['candidates']['TC']}
    if round == 'ptl' and 'TC' in db['projects']:
        dirty = True
        db['projects'].remove('TC')
        del db['candidates']['TC']

    # Check for missing and elected candidates
    for project in db['projects']:
        candidates = db['candidates'][project]
        if len(candidates) == 0:
            print("[W] Appoints candidate for %s" % project)
            candidates.append({
                'ircname': 'INSERT_IRCNAME',
                'email': 'INSERT_EMAIL',
                'fullname': 'INSERT_FULLNAME',
                'elected': 'TC-APPOINTED_OR_INCUMBENT-PTL',
            })
            dirty = True
        elif len(candidates) > 1:
            if not check_elected_candidate(candidates):
                print("[W] Set elected attribute for winner of %s" % project)
                for candidate in candidates:
                    candidate['elected'] = False
                dirty = True
            if project not in db.setdefault('elections_results', {}):
                print("[W] Set election id for %s" % project)
                db['elections_results'][project] = 'INSERT-RESULT-LINK'
                dirty = True
        elif not candidates[0].get('elected'):
            candidates[0]['elected'] = True
            dirty = True
    return dirty


def main():
    desc = 'Generate or update an election archive for site rendering'
    parser = argparse.ArgumentParser(description=desc)
    parser.add_argument('-v', '--verbose', action="count", default=0,
                        help='Increase program verbosity')
    parser.add_argument('-r', '--release', default=utils.SERIES_NAME,
                        help='Which nominations to look at')
    parser.add_argument('-b', '--basedir',
                        default=os.getcwd(),
                        help='Path to git clone of openstack/election')
    parser.add_argument('round', choices=('ptl', 'tc'))

    args = parser.parse_args()

    args.outputdir = os.path.join(args.basedir, 'doc', 'source', args.release)
    args.outputdir = os.path.expanduser(args.outputdir)

    if not os.path.isdir(args.outputdir):
        os.mkdir(args.outputdir, 0755)

    db_file = os.path.join(args.outputdir, "%s.yaml" % args.round)

    if os.path.isfile(db_file):
        print("[+] Reloading candidate list %s" % db_file)
        db = yaml.safe_load(open(db_file))
    else:
        db = utils.build_candidates_list(args.release)

    if process(db, args.round):
        open(db_file, "w").write(yaml.safe_dump(db, default_flow_style=False))
        print("[W] Proceed to manual update of %s" % db_file)
