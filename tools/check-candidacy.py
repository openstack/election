#!/usr/bin/env python

import yaml
import os
import sys
import urllib
import re
import datetime
import pytz
import string

DATE_MIN = '2015-03-04'
DATE_MAX = '2016-01-03'

BASE_URL = 'https://git.openstack.org/cgit'
PROJECTS_TAG = 'march-2016-elections'
PROJECTS_URL = ('%s/openstack/governance/plain/reference/projects.yaml?%s' %
                (BASE_URL, PROJECTS_TAG))

date_min = datetime.datetime.strptime(DATE_MIN, '%Y-%m-%d').strftime('%s')
date_max = datetime.datetime.strptime(DATE_MAX, '%Y-%m-%d').strftime('%s')
now = datetime.datetime.utcnow().replace(tzinfo=pytz.utc,
                                         hour=0,
                                         minute=0,
                                         second=0,
                                         microsecond=0)


def check_atc_date(atc):
    if 'expires-in' not in atc:
        return False
    expires_in = datetime.datetime.strptime(atc['expires-in'], '%B %Y')
    expires_in = expires_in.replace(tzinfo=pytz.utc)
    return now < expires_in


def check_date(date):
    epoch = datetime.datetime.strptime(date, '%Y-%m-%d').strftime('%s')
    if epoch > date_min and epoch < date_max:
        return True
    return False


def escape_author(author):
    author = author.replace(' ', '+')
    author = author.replace('_', '+')

    return author

try:
    project_name = os.path.basename(os.path.dirname(sys.argv[1]))
    author = os.path.basename(sys.argv[1])[:-4]
except:
    print "usage: %s candidacy_file" % sys.argv[0]
    exit(1)

author = author.replace('_', ' ')

if not os.path.isfile('.projects.yaml'):
    open('.projects.yaml', 'w').write(
        urllib.urlopen(PROJECTS_URL).read()
    )
projects = yaml.load(open('.projects.yaml'))
project_list = None

if project_name == "TC":
    project_list = projects.values()
else:
    for key in projects.keys():
        for dirname in [key, string.capwords(key, '-'),
                        key.replace(' ', '_'),
                        string.capwords(key.replace(' ', '_'), '_')]:
            if dirname == project_name:
                project_list = [projects[key]]
                break

if project_list is None:
    print "Can't find project [%s] in %s" % (project_name, projects.keys())
    exit(1)

for project in project_list:
    if 'extra-atcs' in project:
        for atc in project['extra-atcs']:
            if atc['name'] == author and check_atc_date(atc):
                print "Valid extra ATC record", atc
                exit(0)
    for deliverable in project['deliverables'].values():
        for repo_name in deliverable["repos"]:
            url = '%s/%s/log/?qt=author&q=%s' % (BASE_URL, repo_name,
                                                 escape_author(author))
            print "Querying: %s" % url
            found = False
            for l in urllib.urlopen(url).read().split('\n'):
                if "commit/?id=" not in l:
                    continue
                try:
                    url = ('http://git.openstack.org%s' %
                           re.search("href='([^']*)'", l).groups()[0])
                    date = re.search('<td>([^<]*)</td>', l).groups()[0]
                    if not check_date(date):
                        continue
                except:
                    continue
                print "[%s]: %s" % (date, url)
                found = True
            if found:
                exit(0)
exit(1)
