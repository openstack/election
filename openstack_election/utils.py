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

import datetime
import json
import os
import pickle
import pytz
import requests
import time
import yaml

from six.moves.urllib.parse import quote_plus
from six.moves.urllib.request import urlopen

from openstack_election import config
from openstack_election import owners


# Library constants
CANDIDATE_PATH = 'candidates'
GERRIT_BASE = 'https://review.openstack.org'
ELECTION_REPO = 'openstack/election'
CGIT_URL = 'https://git.openstack.org/cgit'
PROJECTS_URL = ('%s/openstack/governance/plain/reference/projects.yaml' %
                (CGIT_URL))

conf = config.load_conf()
exceptions = None


# Generic functions
def requester(url, params={}, headers={}):
    """A requests wrapper to consistently retry HTTPS queries"""

    # Try up to 3 times
    retry = requests.Session()
    retry.mount("https://", requests.adapters.HTTPAdapter(max_retries=3))
    return retry.get(url=url, params=params, headers=headers)


def load_exceptions():
    global exceptions
    exceptions = {}
    for e in open("exceptions.txt").readlines():
        if e[0] == "#" or ":" not in e:
            continue
        exceptions[e.split(':')[0]] = " ".join(e.split(':')[1:])[:-1].strip()


def get_event(event_name):
    for e in conf['timeline']:
        if e['name'] == event_name:
            return e
    raise ValueError("Couldn't find event_name %s" % event_name)


# Gerrit functions
def gerrit_datetime(dt):
    return dt.strftime('%Y-%m-%d %H:%M:%S %z')


def gerrit_query(url, params=None):
    r = requester(url, params=params)
    if r.status_code == 200:
        data = json.loads(r.text[4:])
    else:
        data = []
    return data


def get_email(filepath):
    return os.path.basename(filepath)


def get_gerrit_account(email):
    accounts = gerrit_query('%s/accounts/' % (GERRIT_BASE),
                            params={'q': email, 'o': ['DETAILS']})
    if not accounts:
        raise ValueError("Couldn't find gerrit account with '%s'" % email)
    if len(accounts) != 1:
        print("[I] %s has multiple account: %s" % (email, accounts))
    return accounts[0]


def get_irc(member, filepath=None):
    irc = ''
    member_data = member.get('data', [])
    if member_data:
        irc = member_data[0].get('irc', '')
    return irc


def get_fullname(member, filepath=None):
    # Check if filepath is an exception
    if filepath and exceptions is None:
        load_exceptions()
    if filepath and filepath in exceptions:
        return exceptions[filepath]

    full_name = u''
    member_data = member.get('data', [])
    if member_data:
        first_name = member_data[0].get('first_name', '')
        last_name = member_data[0].get('last_name', '')
        if first_name or last_name:
            full_name = first_name + ' ' + last_name

    return full_name


def get_reviews(query):
    opts = ['CURRENT_REVISION', 'CURRENT_FILES', 'DETAILED_ACCOUNTS']
    opts_str = '&o=%s' % ('&o='.join(opts))
    url = ('%s/changes/?q=%s%s' %
           (GERRIT_BASE, quote_plus(query, safe='/:=><^.*'), opts_str))
    return gerrit_query(url)


def candidate_files(review):
    return list(filter(lambda x: x.startswith(CANDIDATE_PATH),
                       list(review['revisions'].values())[0]['files'].keys()))


# Governance functions
def check_atc_date(atc):
    if 'expires-in' not in atc:
        return False
    expires_in = datetime.datetime.strptime(atc['expires-in'], '%B %Y')
    expires_in = expires_in.replace(tzinfo=pytz.utc)
    return conf['timeframe']['end'] < expires_in


def get_projects(tag=None):
    url = PROJECTS_URL
    cache_file = '.projects.pkl'

    if tag:
        url += '?h=%s' % tag
        cache_file = '.projects.%s.pkl' % tag

    # Refresh the cache if it's not there or if it's older than a week
    if (not os.path.isfile(cache_file) or
            os.stat(cache_file).st_size < 100 or
            os.stat(cache_file).st_mtime + (7*24*3600) < time.time()):
        print("[+] Updating %s" % (cache_file))
        data = yaml.safe_load(urlopen(url).read())
        pickle.dump(data, open(cache_file, "wb"), protocol=2)

    return pickle.load(open(cache_file, "rb"))


# Election functions
def name2dir(name):
    """Convert project name to directory name: only [a-zA-Z_] in camelcase"""
    name = name.replace(' ', '_').replace('-', '_')
    return "_".join(map(lambda x: x[0].upper()+x[1:], name.split('_')))


def dir2name(name, projects):
    """Convert directory name to original project name"""
    name = name.replace('_', '').lower()
    for project_name in projects:
        pname = project_name.lower().replace(' ', '').replace('-', '').lower()
        if name == pname:
            return project_name
    raise ValueError(('%s does not match any project' % (name)))


def is_tc_election():
    return conf.get('election_type', '').lower() == 'tc'


def build_candidates_list(election=conf['release']):
    election_path = os.path.join(CANDIDATE_PATH, election)
    if os.path.exists(election_path):
        project_list = os.listdir(election_path)
    else:
        project_list = []

    if is_tc_election():
        project_list = list(filter(
            lambda p: p in ['TC'],
            project_list
        ))
    else:
        project_list = list(filter(
            lambda p: p not in ['TC'],
            project_list
        ))

    project_list.sort()
    candidates_lists = {}
    for project in project_list:
        project_prefix = os.path.join(CANDIDATE_PATH, election, project)
        file_list = list(filter(
            lambda x: '@' in x,
            os.listdir(project_prefix),
        ))
        candidates_list = []
        for candidate_file in file_list:
            filepath = os.path.join(project_prefix, candidate_file)
            email = get_email(filepath)
            member = owners.lookup_member(email)
            candidates_list.append(
                {
                    'url': ('%s/%s/plain/%s' %
                            (CGIT_URL, ELECTION_REPO,
                             quote_plus(filepath, safe='/'))),
                    'email': email,
                    'ircname': get_irc(member),
                    'fullname': get_fullname(member, filepath=filepath)
                })

        candidates_list.sort(key=lambda x: x['fullname'])
        candidates_lists[project] = candidates_list

    return {'election': election,
            'projects': project_list,
            'candidates': candidates_lists}
