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

import prettytable

CIVS_BASE_OLD = 'https://civs.cs.cornell.edu/cgi-bin/results.pl'
CIVS_BASE = 'https://civs1.civs.us/cgi-bin/results.pl'
data = [
    {
        'election': '10/2013',  # Icehouse
        'electorate': 1106,
        'votes_cast': 342,
    },
    {
        'election': '04/2014',   # Juno
        'electorate': 1510,
        'votes_cast': 448,
    },
    {
        'election': '10/2014',  # Kilo
        'electorate': 1893,
        'votes_cast': 506,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_c105db929e6c11f4')
    },
    {
        'election': '04/2015',  # Liberty
        'electorate': 2169,
        'votes_cast': 548,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_ef1379fee7b94688')
    },
    {
        'election': '10/2015',  # Mitaka
        'electorate': 2759,
        'votes_cast': 619,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_4ef58718618691a0')
    },
    {
        'election': '04/2016',  # Newton
        'electorate': 3284,
        'votes_cast': 652,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_fef5cc22eb3dc27a')
    },
    {
        'election': '10/2016',  # Ocata
        'electorate': 3517,
        'votes_cast': 801,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_356e6c1b16904010')
    },
    {
        'election': '04/2017',  # Pike
        'electorate': 3191,
        'votes_cast': 427,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_072c4cd7ff0673b5')
    },
    {
        'election': '10/2017',  # Queens
        'electorate': 2430,
        'votes_cast': 420,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_ce86063991ef8aae')
    },
    {
        'election': '04/2018',  # Rocky
        'electorate': 2025,
        'votes_cast': 384,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_98430d99fc2ed59d')
    },
    {
        'election': '09/2018',  # Stein
        'electorate': 1636,
        'votes_cast': 403,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_f773fda2d0695864')
    },
    {
        'election': '03/2019',  # Train
        'electorate': 1390,
        'votes_cast': 279,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_6c71f84caff2b37c')
    },
    # Ussuri is missing as we didn't have an election because the number of
    # candidates matched the number of available seats
    {
        'election': '04/2020',  # Victoria
        'electorate': 808,
        'votes_cast': 208,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_95cb11614fb23566')
    },
    {
        'election': '10/2020',  # Wallaby
        'electorate': 619,
        'votes_cast': 181,
        'results': '%s?id=%s' % (CIVS_BASE_OLD, 'E_f3d92f86f4254553')
    },
    {
        'election': '04/2021',  # Xena
        'electorate': 528,
        'votes_cast': 83,
        'results': '%s?id=%s' % (CIVS_BASE, 'E_69909177d200947c')
    },
    # Yoga is missing as we didn't have an election because the number of
    # candidates matched the number of available seats
    # Zed is missing as we didn't have an election because the number of
    # candidates matched the number of available seats
    {
        'election': '09/2022',  # 2023.1 Antelope
        'electorate': 395,
        'votes_cast': 61,
        'results': '%s?id=%s' % (CIVS_BASE, 'E_41d42603087bcf58')
    },
    # 2023.2 Bobcat is missing as we didn't have an election because the number
    # of candidates matched the number of available seats
    {
        'election': '09/2023',  # 2024.1 Caracal
        'electorate': 309,
        'votes_cast': 51,
        'results': '%s?id=%s' % (CIVS_BASE, 'E_36ebf2eba022aded')
    },
    {
        'election': '03/2024',  # 2024.2 Dalmatian
        'electorate': 298,
        'votes_cast': 57,
        'results': '%s?id=%s' % (CIVS_BASE, 'E_f8044ce7af316bf3')
    },
    {
        'election': '09/2024',  # 2025.1 Epoxy
        'electorate': 284,
        'votes_cast': 61,
        'results': '%s?id=%s' % (CIVS_BASE, 'E_079cc0f0dda5010c')
    },
]


def change(data, idx, key):
    if idx == 0:
        return float('NaN')
    return 100 * ((data[idx][key] / data[idx-1][key]) - 1)


pt = prettytable.PrettyTable(['Election',
                              'Electorate  (delta %)',
                              'Voted   (delta %)',
                              'Turnout %   (delta %)'])
for idx, current in enumerate(data):
    current['turnout'] = 100 * (current['votes_cast'] / current['electorate'])
    current['electorate_change'] = change(data, idx, 'electorate')
    current['voter_change'] = change(data, idx, 'votes_cast')
    current['turnout_change'] = change(data, idx, 'turnout')

    pt.add_row(['%(election)8s' % current,
                '%(electorate)10d  (%(electorate_change)7.2f)' % current,
                '%(votes_cast)5d   (%(voter_change)7.2f)' % current,
                ' %(turnout)7.2f   (%(turnout_change)7.2f)' % current])

print(pt)
print("\nElection CIVS links")

for election in data:
    if 'results' in election:
        print("%(election)8s: %(results)s" % election)
