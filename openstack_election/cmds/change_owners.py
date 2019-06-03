# Copyright (c) 2016 OpenStack Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language
# governing permissions and limitations under the License.

# Description: When run using OpenStack's Gerrit server, this builds
# YAML representations of aggregate change owner details and change
# counts for each governance project-team, as well as a combined set
# for all teams.

# Rationale: The OpenStack Technical Committee and Project Team Lead
# elections need electorate rolls taken from "Active Technical
# Contributors" to any repos under official project-teams over a
# particular timeframe. Similarly, the OpenStack Foundation gives
# summit registration discount codes to contributors meeting similar
# criteria. The Gerrit REST API provides access to all the data
# necessary to identify these individuals.

# Use: The results end up in files named for each
# official governance project-team (or "all") ending with a .yaml
# extension. At the time of writing, it takes approximately 30
# minutes to run on a well-connected machine with 70-80ms round-trip
# latency to review.openstack.org.

# An example for generating the March 2016 technical election rolls:
#
#     $ virtualenv venv
#     [...]
#     $ ./venv/bin/pip install /path/to/openstack/election
#     [...]
#     $ owners -a 2015-03-04 \
#           -b 2016-03-04 -o owners -r march-2016-elections
#     MISSING: ansible-build-image
#     MERGING DUPLICATE ACCOUNT: 8074 into 2467
#     [...blah, blah, blah...wait for completion...]
#
# TODO(fungi): Add a pass which will correctly generate the
# stable_branch_maintenance.* files. In the meantime, to properly
# generate the SBM PTL electorate, run a second time with a
# different -o of sbm, adding the -n and -s options, and then copy
# the full electorate over like:
#
#     $ owners -a 2015-03-04 \
#           -b 2016-03-04 -o sbm -r march-2016-elections \
#           -n -s 'branch:^stable/.*'
#     [...wait for completion again...]
#     $ cp sbm/_electorate.txt owners/stable_branch_maintenance.txt
#     $ cp sbm/_all_owners.yaml owners/stable_branch_maintenance.yaml
#
# Once complete, make a compressed tarball of the owners directory
# and send it attached to a PGP/MIME signed message to the appointed
# election officials. The various *.txt files are lists of the
# preferred addresses of all valid voters for the various PTL
# elections (whose team names correspond to the file names),
# suitable for passing directly to CIVS. The similarly named *.yaml
# files are detailed structured data about the same sets of voters,
# for use in validating the address lists. The _electorate.txt file
# is the equivalent address list for the TC election voters, and its
# corresponding structured data is in _all_owners.yaml.

# You can also do interesting analysis on _all_owners.yaml, for
# example:
#
#     $ ./venv/bin/python
#     >>> import yaml
#     >>>
#     >>> o = yaml.load(open('owners/_all_owners.yaml'))
#     >>> for c in range(5):
#     ...     print('Owners of at least %s changes: %s' % (
#     ...         c+1,
#     ...         len({k: v for k, v in o.iteritems() if v['count'] > c})))
#     ...
#     Owners of at least 1 changes: 3239
#     Owners of at least 2 changes: 2352
#     Owners of at least 3 changes: 1924
#     Owners of at least 4 changes: 1682
#     Owners of at least 5 changes: 1504


from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals

import argparse
import sys

from openstack_election import owners


def usage(argv=sys.argv):
    """Parse command line argument"""
    parser = argparse.ArgumentParser(
        description="When run using OpenStack's Gerrit server, this builds "
        "YAML representations of aggregate change owner details and change "
        "counts for each governance project-team, as well as a combined set "
        "for all teams. Before and after dates/times should be supplied in "
        "formats Gerrit accepts: https://review.openstack.org/Documentation/"
        "user-search.html#search-operators")
    parser.add_argument("-a", "--after", help="Start date for matching merges")
    parser.add_argument("-b", "--before", help="End date for matching merges")
    parser.add_argument("-c", "--config", help="Path to script configuration")
    parser.add_argument("-m", "--nonmember",
                        help="include non-foundation-members in electorate",
                        action="store_true")
    parser.add_argument("-i", "--ignore", help="Account Id numbers to skip",
                        action='append')
    parser.add_argument("-l", "--legacy", help="Path to legacy projects file")
    parser.add_argument("-n", "--no-extra-atcs", help='Omit "extra ATCs"',
                        dest='no_extra_atcs', action='store_true')
    parser.add_argument("-o", "--outdir", help="Create an output directory")
    parser.add_argument("-p", "--projects", help="Path to local projects file")
    parser.add_argument("-r", "--ref", help="Specify a Governance refname")
    parser.add_argument("-s", "--sieve", help="Add Gerrit query parameters")

    return parser.parse_args(argv[1:])


def main():
    options = usage()

    return owners.main(options)
