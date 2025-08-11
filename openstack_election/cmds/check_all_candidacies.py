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

from openstack_election.cmds import ci_check_all_candidate_files as checks
from openstack_election import utils

results = []


def get_reviews(verbose=0):
    return utils.get_reviews('is:open project:%s file:^%s/%s/.*' %
                             (utils.ELECTION_REPO, utils.CANDIDATE_PATH,
                              utils.conf['release']), verbose=verbose)


def print_member(filepath, verbose=0):
    email = utils.get_email(filepath)
    member = utils.lookup_member(email, verbose=verbose)
    member_id = member.get('data', [{}])[0].get('id')
    base = 'https://openinfra.org/a/community/members'
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
    parser.add_argument('--interactive', dest='interactive', default=False,
                        action='store_true',
                        help=('Pause after each review to manually post '
                              'results'))
    parser.add_argument('-v', '--verbose', action="count", default=0,
                        help='Increase program verbosity')

    args = parser.parse_args()
    projects = utils.get_projects(tag=args.tag, fallback_to_master=True)
    election_type = utils.conf.get('election_type', '').lower()

    for review in get_reviews(verbose=args.verbose):
        if review['status'] != 'NEW':
            continue

        review_url = '%s/%d' % (utils.GERRIT_BASE, review['_number'])
        print('\n\nChecking %s' % (review_url))

        for filepath in utils.candidate_files(review):
            email = utils.get_email(filepath)
            team = os.path.basename(os.path.dirname(filepath))

            # Some kind souls remove the .placeholder file when they upload
            # a candidacy
            if email == '.placeholder':
                continue

            candiate_ok = checks.validate_filename(filepath)
            if candiate_ok:
                candiate_ok = checks.validate_member(filepath,
                                                     verbose=args.verbose)

            if candiate_ok:
                # If we're a PTL election OR if the team is not TC we need
                # to check for validating changes
                if (election_type == 'ptl'
                        or (election_type == 'combined' and team != 'TC')):
                    if args.interactive:
                        print('The following commit and profile validate this '
                              'candidate:')
                    candiate_ok = checks.check_for_changes(
                        projects, filepath, args.limit,
                        verbose=args.verbose)
                    print_member(filepath, verbose=args.verbose)
                else:
                    print('Not checking for changes as this is a TC election')
            else:
                print('Not checking for changes as %s doesn\'t seem to '
                      'describe a valid candidacy' % (filepath))

            if args.interactive:
                try:
                    input('Next review?')
                except KeyboardInterrupt:
                    print('')
                    return 0

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
