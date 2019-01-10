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


def main():
    description = ('Check if the owner of a change is a valid candidate as '
                   'described in the change')
    parser = argparse.ArgumentParser(description)
    parser.add_argument(dest='change_id', help=('A valid gerrit change ID'))
    parser.add_argument('--limit', dest='limit', type=int, default=1,
                        help=('How many validating changes to report.  '
                              'A negative value means report many.  '
                              'Default: %(default)s'))
    parser.add_argument('--tag', dest='tag', default=utils.conf['tag'],
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))

    args = parser.parse_args()
    review = utils.get_reviews(args.change_id)[0]
    owner = review.get('owner', {})
    if args.limit < 0:
        args.limit = 100

    try:
        found = check_candidacy.check_candidacy_review(review['change_id'],
                                                       tag=args.tag,
                                                       review=review)
    except Exception as exc:
        print("[E] %s\n\n" % (exc))
    else:
        if found:
            print('SUCCESS: %s is a valid candidate\n\n' % (owner['email']))
            return 0
        else:
            print('[E]: %s is not a valid candidate\n\n' % (owner['email']))
            return 1
