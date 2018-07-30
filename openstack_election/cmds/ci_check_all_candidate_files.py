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
import glob
import os

from openstack_election import check_candidacy
from openstack_election import utils


def validate_release(release):
    print('Validate Release')
    print('----------------')

    release_path = os.path.join(utils.CANDIDATE_PATH, release)
    is_valid = (os.path.exists(release_path) and os.path.isdir(release_path))

    print('Release: %s [%s] is %sok' % (release, release_path,
                                        {True: '', False: 'not '}[is_valid]))
    print('')
    return is_valid


def validate_filename(filepath):
    print('Validate file name looks like an email address')
    print('----------------------------------------------')

    file_name = utils.get_email(filepath)
    is_valid = '@' in file_name

    print('Filename: %s [%s] is %sok' % (file_name, filepath,
                                         {True: '', False: 'not '}[is_valid]))
    print('')
    return is_valid


def validate_member(filepath):
    print('Validate email address is OSF member')
    print('------------------------------------')

    email = utils.get_email(filepath)
    member = utils.lookup_member(email)
    is_valid = member.get('data', []) != []

    print('Email address: %s is %sok' % (email,
                                         {True: '', False: 'not '}[is_valid]))
    print('')
    return is_valid


def check_for_changes(projects, filepath, limit):
    print('Looking for validating changes')
    print('------------------------------')

    email = utils.get_email(filepath)
    project_name = os.path.basename(os.path.dirname(filepath))
    project_name = utils.dir2name(project_name, projects)

    changes_found = check_candidacy.check_candidate(project_name, email,
                                                    projects, limit)
    print('')
    return bool(changes_found)


def main():
    description = ('Check all files under the current open election are valid')
    parser = argparse.ArgumentParser(description)

    parser.add_argument('--limit', dest='limit', type=int, default=1,
                        help=('How many validating changes to report.  '
                              'A negative value means report many.  '
                              'Default: %(default)s'))
    parser.add_argument('--tag', dest='tag', default=utils.conf['tag'],
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))
    parser.add_argument('--release', dest='release',
                        default=utils.conf['release'],
                        help=('The relase to validate candidates against.  '
                              'Default: %(default)s'))

    args = parser.parse_args()
    errors = False

    if not validate_release(args.release):
        return 1

    projects = utils.get_projects(tag=args.tag, fallback_to_master=True)

    for filepath in glob.glob(os.path.join(utils.CANDIDATE_PATH,
                                           args.release, '*', '*')):
        candiate_ok = True

        candiate_ok &= validate_filename(filepath)
        candiate_ok &= validate_member(filepath)

        if candiate_ok and utils.is_tc_election:
            candiate_ok &= check_for_changes(projects, filepath, args.limit)

        errors |= not candiate_ok

    return 1 if errors else 0
