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

import datetime
import json
import os
import pickle
import pytz
import requests
import sys
import time
import yaml

from urllib.error import HTTPError
from urllib.parse import quote_plus
from urllib.request import urlopen

from openstack_election import config
from openstack_election import exception


# Library constants
CANDIDATE_PATH = 'candidates'
GERRIT_BASE = 'https://review.opendev.org'
ELECTION_REPO = 'openstack/election'
GIT_URL = 'https://opendev.org/'
PROJECTS_URL = GIT_URL + 'openstack/governance/raw/%s/reference/projects.yaml'

conf = config.load_conf()
exceptions = None


# Generic functions
def requester(url, params={}, headers={}, verbose=0):
    """A requests wrapper to consistently retry HTTPS queries"""

    # Try up to 3 times
    retry = requests.Session()
    retry.mount("https://", requests.adapters.HTTPAdapter(max_retries=3))
    raw = retry.get(url=url, params=params, headers=headers)
    if verbose >= 2:
        print("Queried: %s" % raw.url)
    return raw


def decode_json(raw):
    """Trap JSON decoding failures and provide more detailed errors"""

    # Gerrit's REST API prepends a JSON-breaker to avoid XSS vulnerabilities
    if raw.text.startswith(")]}'"):
        trimmed = raw.text[4:]
    else:
        trimmed = raw.text

    # Try to decode and bail with much detail if it fails
    try:
        decoded = json.loads(trimmed)
    except Exception:
        print('\nrequest returned %s error to query:\n\n    %s\n'
              '\nwith detail:\n\n    %s\n' % (raw, raw.url, trimmed),
              file=sys.stderr)
        raise
    return decoded


def query_gerrit(method, params={}, verbose=0):
    """Query the Gerrit REST API"""

    return decode_json(requester("%s/%s" % (GERRIT_BASE, method),
                                 params=params,
                                 headers={'Accept': 'application/json'},
                                 verbose=verbose))


def load_yaml(yaml_stream):
    """Wrapper to load and return YAML data"""

    return yaml.safe_load(yaml_stream)


def get_from_git(project, obj, params={}, verbose=0):
    """Retrieve a file from the Gitea interface"""

    url = "%s%s/raw/%s" % (GIT_URL, project, obj)
    return load_yaml(requester(url, params=params,
                               headers={'Accept': 'application/json'},
                               verbose=verbose).text)


def get_series_data():
    return get_from_git('openstack/releases',
                        'branch/master/data/series_status.yaml',
                        verbose=99)


def get_schedule_data(series):
    return get_from_git('openstack/releases',
                        'branch/master/doc/source/%s/schedule.yaml' % (series))


def lookup_osf(email, group_slug=None, verbose=0):
    """A requests wrapper to querying the OSF member directory API"""

    params = {
        'expand': 'groups',
        'filter[]': ['email==%s' % email],
        'relations': 'affiliations,groups',
        }
    if group_slug:
        params['filter[]'].append('group_slug==%s' % group_slug)

    # URL pattern for querying foundation profiles by E-mail address
    raw = requester(
        'https://openstackid-resources.openstack.org/api/public/v1/members',
        params, headers={'Accept': 'application/json'}, verbose=verbose)
    result = decode_json(raw)

    # Print the profile if verbosity is 1 or higher
    if verbose >= 1 and result['data']:
        print("Found: "
              "https://openstack.org/community/members/profile/%s"
              % result['data'][0]['id'])

    return result


def lookup_member(email, verbose=0):
    """Lookup profiles of OSF members"""

    return lookup_osf(
        email=email, group_slug='foundation-members', verbose=verbose)


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


# TODO(tonyb): this is now basically a duplicate of query_gerrit()
def gerrit_query(url, params=None, verbose=0):
    r = requester(url, params=params, verbose=verbose)
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
        # The API can return None for nonexistent nicks
        if irc is None:
            irc = ''
    return irc


def get_fullname(member, filepath=None):
    # Check if filepath is an exception
    if filepath and exceptions is None:
        load_exceptions()
    if filepath and filepath in exceptions:
        return exceptions[filepath]

    full_name = ''
    member_data = member.get('data', [])
    if member_data:
        first_name = member_data[0].get('first_name', '')
        last_name = member_data[0].get('last_name', '')
        if first_name or last_name:
            full_name = first_name + ' ' + last_name

    return full_name


def get_reviews(query, verbose=0):
    opts = ['CURRENT_REVISION', 'CURRENT_FILES', 'DETAILED_ACCOUNTS']
    opts_str = '&o=%s' % ('&o='.join(opts))
    url = ('%s/changes/?q=%s%s' %
           (GERRIT_BASE, quote_plus(query, safe='/:=><^.*'), opts_str))
    return gerrit_query(url, verbose=verbose)


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


def _get_projects(tag=None):
    if tag:
        url = PROJECTS_URL % '/'.join(('tag', tag))
        cache_file = '.projects.%s.pkl' % tag
    else:
        url = PROJECTS_URL % 'branch/master'
        cache_file = '.projects.pkl'

    # Refresh the cache if it's not there or if it's older than a week
    if (not os.path.isfile(cache_file) or
            os.stat(cache_file).st_size < 100 or
            os.stat(cache_file).st_mtime + (7*24*3600) < time.time()):
        print("[+] Updating %s" % (cache_file))
        data = load_yaml(urlopen(url).read())
        pickle.dump(data, open(cache_file, "wb"), protocol=2)

    return pickle.load(open(cache_file, "rb"))


def get_projects(tag=None, fallback_to_master=False):
    try:
        projects = _get_projects(tag)
    except HTTPError as exc:
        if exc.code == 404 and tag and fallback_to_master:
            projects = _get_projects()
        else:
            raise
    return projects


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


def election_is_running():
    # Assume that the start of the first item in and the end of the last
    # defines is a reasonable approximation to "election is running"
    timeline = conf.get('timeline')
    if timeline:
        start = timeline[0]['start']
        end = timeline[-1]['end']
        now = datetime.datetime.utcnow().replace(tzinfo=pytz.utc)
        return start <= now <= end
    return False


def find_all_projects(election=conf['release']):
    election_path = os.path.join(CANDIDATE_PATH, election)
    if os.path.exists(election_path):
        project_list = os.listdir(election_path)
    else:
        project_list = []

    return project_list


def find_candidate_files(election=conf['release']):
    project_list = find_all_projects(election)
    election_type = conf.get('election_type', '').lower()
    if election_type == 'tc':
        project_list = list(filter(
            lambda p: p in ['TC'],
            project_list
        ))
    elif election_type == 'ptl':
        project_list = list(filter(
            lambda p: p not in ['TC'],
            project_list
        ))

    election_path = os.path.join(CANDIDATE_PATH, election)
    candidate_files = []
    for project in project_list:
        project_prefix = os.path.join(election_path, project)
        candidate_files += list(filter(
            lambda x: '@' in x,
            [os.path.join(project_prefix, i)
             for i in os.listdir(project_prefix)],
        ))

    candidate_files.sort()
    return candidate_files


def build_candidates_list(election=conf['release']):
    candidate_files = find_candidate_files(election=election)
    candidates_lists = {}
    projects = set()
    for filepath in candidate_files:
        project = os.path.basename(os.path.dirname(filepath))
        if project not in candidates_lists:
            candidates_lists[project] = []
        projects.add(project)

        email = get_email(filepath)
        member = lookup_member(email)

        if member.get('data', []) == []:
            raise exception.MemberNotFoundException(email=email)

        candidates_lists[project].append({
            'url': ('%s%s/raw/branch/master/%s' %
                    (GIT_URL, ELECTION_REPO,
                     quote_plus(filepath, safe='/'))),
            'email': email,
            'ircname': get_irc(member),
            'fullname': get_fullname(member, filepath=filepath)
        })

    leaderless = set(find_all_projects(election)) - projects
    return {'election': election,
            'projects': list(projects),
            'leaderless': list(leaderless),
            'candidates': candidates_lists}


def get_ptl_results(election=conf['release']):
    try:
        resultfd = open('doc/source/results/%s/ptl.yaml' % election)
    except FileNotFoundError:
        return {'candidates': {}}
    return yaml.safe_load(resultfd)
