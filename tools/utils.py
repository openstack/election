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

import os
import time
import urllib
import yaml
import pickle

BASE_URL = 'https://git.openstack.org/cgit'
PROJECTS_URL = ('%s/openstack/governance/plain/reference/projects.yaml' %
                (BASE_URL))


def get_projects(tag=None):
    url = PROJECTS_URL
    cache_file = '.projects.pkl'

    if tag:
        url += '?%s' % tag
        cache_file = '.projects.%s.pkl' % tag

    # Refresh the cache if it's not there or if it's older than a week
    if (not os.path.isfile(cache_file) or
            os.stat(cache_file).st_size < 100 or
            os.stat(cache_file).st_mtime + (7*24*3600) < time.time()):
        print "[+] Updating %s" % cache_file
        data = yaml.safe_load(urllib.urlopen(url).read())
        pickle.dump(data, open(cache_file, "w"))

    return pickle.load(open(cache_file))


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
