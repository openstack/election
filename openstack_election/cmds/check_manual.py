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
    description = ('Check thath the email address is a valid candidate for '
                   ' the specified project')
    parser = argparse.ArgumentParser(description)
    parser.add_argument(dest='project_name',
                        help=('The Project the candidate is applying for'))
    parser.add_argument(dest='email',
                        help=('An email address registered to the candidate'))
    parser.add_argument('--limit', dest='limit', type=int, default=1,
                        help=('How many validating changes to report.  '
                              'A negative value means report many.  '
                              'Default: %(default)s'))
    parser.add_argument('--tag', dest='tag', default=utils.conf['tag'],
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))
    parser.add_argument('-v', '--verbose', action="count", default=0,
                        help='Increase program verbosity')

    args = parser.parse_args()
    if args.limit < 0:
        args.limit = 100

    projects = utils.get_projects(tag=args.tag)
    projects_list = list(projects.keys())
    if args.project_name not in projects_list:
        print('[E]: %s not found in: %s' %
              (args.project_name, ','.join(projects_list)))
        return 1

    if check_candidacy.check_candidate(args.project_name, args.email,
                                       projects, limit=args.limit,
                                       verbose=args.verbose):
        print('SUCCESS: %s is a valid candidate\n\n' % (args.email))
        return 0
    else:
        print('[E]: %s is not a valid candidate\n\n' % (args.email))
        return 1
