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
import subprocess

from openstack_election import check_candidacy
from openstack_election import utils


def validate_release(release):
    print('Validate Release')
    print('----------------')

    release_path = os.path.join(utils.CANDIDATE_PATH, release)
    is_valid = (os.path.exists(release_path) and os.path.isdir(release_path))

    print('Release: %s [%s] %s' % (release, release_path,
                                   {True: 'PASS', False: 'FAIL'}[is_valid]))
    print('')
    return is_valid


def validate_filename(filepath):
    print('Validate file name looks like an email address')
    print('----------------------------------------------')

    file_name = utils.get_email(filepath)
    is_valid = '@' in file_name

    print('Filename: %s [%s] %s' % (file_name, filepath,
                                    {True: 'PASS', False: 'FAIL'}[is_valid]))
    print('')
    return is_valid


def validate_project(filepath, projects):
    print('Validate the project requires a PTL')
    print('-----------------------------------')

    project_name = utils.get_project(filepath)
    leadership_type = projects.get(project_name, {}).get("leadership_type")
    is_valid = leadership_type not in ["distributed"]

    print('Project Name: %s [%s]' % (project_name, filepath))
    print('Leadership Type: %s %s' % (leadership_type,
                                      {True: 'PASS', False: 'FAIL'}[is_valid]))
    print('')
    return is_valid


def validate_member(filepath, verbose=0):
    print('Validate email address is OIF member')
    print('------------------------------------')

    email = utils.get_email(filepath)
    member = utils.lookup_member(email, verbose=verbose)
    is_valid = member.get('data', []) != []

    print('Email address: %s %s' % (email,
                                    {True: 'PASS', False: 'FAIL'}[is_valid]))
    print('')
    return is_valid


# NOTE(tonyb): Currently verbose isn't used but it's included to keep
#              the interface the same as the validate_*() functions.
def show_affiliation(filepath, verbose=0):
    print('Show member affiliation if available')
    print('------------------------------------')

    email = utils.get_email(filepath)
    member = utils.lookup_member(email)

    print('Affiliation: %s' % (utils.current_member_affiliation(member)))


def check_for_changes(projects, filepath, limit, verbose=0):
    print('Looking for validating changes')
    print('------------------------------')

    email = utils.get_email(filepath)
    project_name = os.path.basename(os.path.dirname(filepath))
    project_name = utils.dir2name(project_name, projects)

    changes_found = check_candidacy.check_candidate(project_name, email,
                                                    projects, limit,
                                                    verbose=verbose)
    print('Email address: %s %s' % (
        email, {True: 'PASS', False: 'FAIL'}[changes_found]))
    print('')
    return bool(changes_found)


def find_modified_candidate_files():
    "Return a list of non-removed files modified by the most recent commit."
    results = subprocess.check_output(
        ['git', 'diff', '--name-only', '--pretty=format:', 'HEAD^']
    ).decode('utf-8')
    filenames = [
        li.strip()
        for li in results.splitlines()
        if (li.startswith(utils.CANDIDATE_PATH + '/') and
            os.path.exists(li) and
            not li.endswith('.placeholder'))
    ]
    return filenames


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
    parser.add_argument('--HEAD',
                        dest='head_only',
                        action='store_true',
                        default=False,
                        help='Validate all candidates.')
    parser.add_argument('files',
                        nargs='*',
                        help='Candidate files to validate.')
    parser.add_argument('-v', '--verbose', action="count", default=0,
                        help='Increase program verbosity')

    args = parser.parse_args()
    errors = False

    if not utils.election_is_running():
        print('no current active election')
        return 0

    if not validate_release(args.release):
        return 1

    projects = utils.get_projects(tag=args.tag, fallback_to_master=True)
    election_type = utils.conf.get('election_type', '').lower()

    if args.files:
        to_process = args.files
    elif args.head_only:
        to_process = find_modified_candidate_files()
    else:
        to_process = utils.find_candidate_files(election=args.release)

    for filepath in to_process:
        email = utils.get_email(filepath)
        team = os.path.basename(os.path.dirname(filepath))

        # Some kind souls remove the .placeholder file when they upload
        # a candidacy
        if email == '.placeholder':
            continue

        candidate_ok = True

        candidate_ok &= validate_filename(filepath)
        candidate_ok &= validate_project(filepath, projects)
        candidate_ok &= validate_member(filepath, verbose=args.verbose)
        show_affiliation(filepath, verbose=args.verbose)

        if candidate_ok:
            if (election_type == 'ptl'
                    or (election_type == 'combined' and team != 'TC')):
                candidate_ok &= check_for_changes(projects, filepath,
                                                  args.limit,
                                                  verbose=args.verbose)

        errors |= not candidate_ok

    return 1 if errors else 0
