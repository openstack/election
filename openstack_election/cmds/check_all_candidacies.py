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

from openstack_election.cmds import ci_check_all_candidate_files as checks
from openstack_election import utils

results = []


def get_reviews():
    return utils.get_reviews('is:open project:%s file:^%s/%s/.*' %
                             (utils.ELECTION_REPO, utils.CANDIDATE_PATH,
                              utils.conf['release']))


def print_member(filepath):
    email = utils.get_email(filepath)
    member = utils.lookup_member(email)
    member_id = member.get('data', [{}])[0].get('id')
    base = 'https://www.openstack.org/community/members/profile'
    print('OSF member profile: %s/%s' % (base, member_id))


def main():
    description = ('Check all open reviews for candidacies')
    parser = argparse.ArgumentParser(description)
    parser.add_argument('--limit', dest='limit', type=int, default=1,
                        help=('How many validating changes to report.  '
                              'A negative value means report many.  '
                              'Default: %(default)s'))
    parser.add_argument('--tag', dest='tag', default=utils.conf['tag'],
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))

    args = parser.parse_args()
    projects = utils.get_projects(tag=args.tag, fallback_to_master=True)

    for review in get_reviews():
        if review['status'] != 'NEW':
            continue

        review_url = '%s/%d' % (utils.GERRIT_BASE, review['_number'])
        print('Checking %s' % (review_url))

        for filepath in utils.candidate_files(review):
            email = utils.get_email(filepath)
            team = os.path.basename(os.path.dirname(filepath))

            # Some kind souls remove the .placeholder file when they upload
            # a candidacy
            if email == '.placeholder':
                continue

            candiate_ok = checks.validate_filename(filepath)
            if candiate_ok:
                candiate_ok = checks.validate_member(filepath)

            if candiate_ok:
                if utils.is_tc_election:
                    candiate_ok = checks.check_for_changes(projects, filepath,
                                                           args.limit)
                    print_member(filepath)
                else:
                    print('Not checking for changes as this is a TC election')
            else:
                print('Not checking for changes as %s doesn\'t seem to '
                      'describe a valid candidacy' % (filepath))

            results.append((review_url, email, team, candiate_ok))

    print('\n\n\n')
    print('*' * 80)
    for result in results:
        (review_url, email, team, candiate_ok) = result
        print(review_url)
        if candiate_ok:
            print(' SUCCESS: %s is a valid candidate for %s' % (email, team))
        else:
            print(' ERROR: Candidate %s is not valid, please review '
                  'previous messages for details.' % (email))
    print('*' * 80)
    return 0
