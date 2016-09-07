#!/usr/bin/env python
#
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

import sys

import check_candidacy
import utils


def get_reviews():
    return utils.get_reviews('is:open project:%s' %
                             (utils.ELECTION_REPO))


def check_reviews():
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
            found = check_candidacy.check_candidacy(review['change_id'],
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


if __name__ == "__main__":
    sys.exit(check_reviews())
