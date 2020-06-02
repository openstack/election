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
import yaml

from openstack_election import utils
from pprint import pprint


def main():
    description = ('Check if email address or gerrit username is an APC')
    parser = argparse.ArgumentParser(description)
    parser.add_argument('-b', '--basedir', dest='basedir',
                        default=os.getcwd(),
                        help='Path to git clone of openstack/election')
    parser.add_argument('--tag', dest='tag', default=utils.PROJECTS_TAG,
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))
    parser.add_argument(dest='user',
                        help=('Email address or gerrit username to look for'))

    args = parser.parse_args()
    basedir = os.path.join(os.path.expanduser(args.basedir), 'rolls', args.tag)

    for directory, directories, files in os.walk(basedir):
        for filename in files:
            if not filename.endswith('.yaml'):
                continue

            if filename in ['_all_owners.yaml', '_duplicate_owners.yaml']:
                continue

            with open(os.path.join(directory, filename)) as fh:
                roll = yaml.safe_load(fh)

            print(filename[:-5])
            for uid, apc in roll.items():
                if (apc.get('preferred') == args.user or
                        apc.get('username') == args.user):
                    pprint(apc)

    return 0
