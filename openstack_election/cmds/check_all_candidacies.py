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

from openstack_election import check_candidacy
from openstack_election import utils


def get_reviews():
    return utils.get_reviews('is:open project:%s file:^%s/%s/.*' %
                             (utils.ELECTION_REPO, utils.CANDIDATE_PATH,
                              utils.SERIES_NAME))


def main():
    description = ('Check if the owner of open changes are valid candidates as'
                   ' described in the change')
    parser = argparse.ArgumentParser(description)
    parser.add_argument('--tag', dest='tag', default=utils.PROJECTS_TAG,
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))

    args = parser.parse_args()
    for review in get_reviews():
        if review['status'] != 'NEW':
            continue

        print('Checking %s/%d' %
              (utils.GERRIT_BASE, review['_number']))

        if not len(utils.candidate_files(review)):
            print("[E] No candidacy added")
            continue

        owner = review.get('owner', {})
        try:
            found = check_candidacy.check_candidacy_review(review['change_id'],
                                                           tag=args.tag,
                                                           review=review)
        except Exception as exc:
            print("[E] %s\n\n" % (exc))
        else:
            if found:
                print('SUCESS: %s is a valid candidate\n\n' %
                      (owner['email']))
            else:
                print('[E]: %s is not a valid candidate\n\n' %
                      (owner['email']))
    return 0
