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

from __future__ import division
from __future__ import print_function

import glob
import os
import prettytable
import yaml

data = []
names = []
name_map = {}


def change(data, current, key):
    """Look for old elections for thew same project team and compare."""
    retval = float('NaN')
    team = current['team']
    for previous_election_name in names:
        old_election_name = '%s - %s' % (previous_election_name, team)
        if old_election_name in name_map:
            idx = name_map[old_election_name]
            break
    else:
        idx = -1

    if idx != -1:
        idx = name_map[old_election_name]
        retval = 100 * ((current[key] / data[idx][key]) - 1)
    return retval


election_name = None
election_dbs = sorted(glob.glob(os.path.join('doc/source/results',
                                             '*', 'ptl.yaml')))
for election_db in election_dbs:
    with open(election_db) as f:
        election_data = yaml.safe_load(f)

    election_name = election_data['election'].capitalize()
    for election_statistics in election_data.get('election_statistics', []):
        team_name = list(election_statistics.keys())[0]
        current = {}
        current['election'] = '%s - %s' % (election_name, team_name)
        current['team'] = team_name
        current['electorate'] = election_statistics[team_name]['electorate']
        current['votes_cast'] = election_statistics[team_name]['votes_cast']
        current['turnout'] = 100 * (current['votes_cast'] /
                                    current['electorate'])
        current['results'] = election_data['elections_results'][team_name]
        current['electorate_change'] = change(data, current, 'electorate')
        current['voter_change'] = change(data, current, 'votes_cast')
        current['turnout_change'] = change(data, current, 'turnout')

        name_map[current['election']] = len(data)
        data.append(current)
    names.insert(0, election_name)

pt = prettytable.PrettyTable(['Election',
                              'Electorate  (delta %)',
                              'Voted   (delta %)',
                              'Turnout %   (delta %)'])
pt.align['Election'] = 'l'
for idx, current in enumerate(data):
    pt.add_row(['%(election)-8s' % current,
                '%(electorate)10d  (%(electorate_change)7.2f)' % current,
                '%(votes_cast)5d   (%(voter_change)7.2f)' % current,
                ' %(turnout)7.2f   (%(turnout_change)7.2f)' % current])

print(pt)
print("\nElection CIVS links")

for election in data:
    if 'results' in election:
        print("%(election)8s: %(results)s" % election)
