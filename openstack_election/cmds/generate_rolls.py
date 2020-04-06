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
import hashlib
import os
import shutil
import tempfile
import time

from openstack_election import owners
from openstack_election import utils


def change_owners_options_proxy(after, before, ref, outdir='./', sieve=None,
                                no_extra_atcs=False):
    options = argparse.Namespace()

    options.config = None
    options.ignore = []

    options.after = after
    options.before = before
    options.outdir = outdir
    options.ref = ref

    options.no_extra_atcs = no_extra_atcs
    options.sieve = sieve
    options.legacy = None
    options.projects = None
    options.sigs = None
    options.verbose = 0
    options.nonmember = False

    return options


def main():
    start = utils.conf['timeframe']['start']
    end = utils.conf['timeframe']['end']
    description = ('Generate electorate rolls')
    parser = argparse.ArgumentParser(description)
    parser.add_argument('--tag', dest='tag', default=utils.conf['tag'],
                        help=('The governance tag to validate against.  '
                              'Default: %(default)s'))
    parser.add_argument('--rolls_dir', default="./rolls/%s" % (
                        utils.conf['tag']), help=('The output directory.  '
                        'Default: %(default)s'))
    parser.add_argument('--before', default=end.strftime("%Y-%m-%d %H-%M-%S"),
                        help=('The start date.  Default: %(default)s'))
    parser.add_argument('--after', default=start.strftime("%Y-%m-%d"),
                        help=('The end date.  Default: %(default)s'))
    parser.add_argument('--without-stable', dest='with_stable', default=True,
                        action='store_false', help=('Do not include stables'))
    parser.add_argument('--cached-owners-script', default=False,
                        action='store_true', help=('Do not fetch the script'))

    args = parser.parse_args()

    print("Run information:")
    print(" - TAG    : %s" % args.tag)
    print(" - ROLLS  : %s" % args.rolls_dir)
    print(" - STABLE : %s" % args.with_stable)
    print(" - BEFORE : %s" % args.before)
    print(" - AFTER  : %s" % args.after)

    if os.path.isdir(args.rolls_dir):
        shutil.rmtree(args.rolls_dir)
    os.makedirs(args.rolls_dir, 0o700)

    os.chdir(os.path.dirname(args.rolls_dir))
    print("Starting roll generation @%s" % time.ctime())
    options = change_owners_options_proxy(args.after, args.before,
                                          args.tag, args.tag)
    owners.main(options)
    print("Finished roll generation @%s" % time.ctime())

    if args.with_stable:
        tmp_dir = tempfile.mkdtemp(prefix='election.')
        print("Starting (Stable) roll generation @%s" % time.ctime())
        # owners.main() potentially mutates options so create a fresh one
        options = change_owners_options_proxy(args.after, args.before,
                                              args.tag, tmp_dir,
                                              no_extra_atcs=True,
                                              sieve="branch:^stable/.*")
        owners.main(options)
        print("Finished (Stable) roll generation @%s" % time.ctime())
        shutil.copy("%s/_electorate.txt" % tmp_dir,
                    "./%s/stable_branch_maintenance.txt" % args.tag)
        shutil.copy("%s/_all_owners.yaml" % tmp_dir,
                    "./%s/stable_branch_maintenance.yaml" % args.tag)
        shutil.rmtree(tmp_dir)

    print("Electoral rolls SHA256sum")
    with open("%s.shasums" % args.tag, "wb") as ofile:
        for fname in sorted(glob.glob("./%s/*.txt" % args.tag)):
            # Sort the list
            with open(fname) as list_file:
                roll = sorted(list_file.readlines())
            content = "".join(roll).encode('utf-8')
            with open(fname, "wb") as list_file:
                list_file.write(content)
            # Generate the hash
            h = hashlib.sha256(content).hexdigest()
            s = "%s  %s" % (h, fname)
            print(s)
            ofile.write(("%s\n" % s).encode('utf-8'))
