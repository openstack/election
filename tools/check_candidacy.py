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
import os

import utils


# FIXME: Printing from library function isn't great.
#        change API to return the messages and let the consumer decide what to
#        do with them
def check_candidacy(change_id, limit=1, tag=utils.PROJECTS_TAG, review=None):
    def pretty_datetime(dt_str):
        dt = datetime.datetime.strptime(dt_str.split('.')[0],
                                        '%Y-%m-%d %H:%M:%S')
        return dt.strftime('%Y-%m-%d')

    projects = utils.get_projects(tag=tag)

    # If there is more than one review that matches this change_id then all
    # bets are off
    review = review or utils.get_reviews(change_id)[0]
    owner = review.get('owner', {})
    found = 0

    for filename in utils.candidate_files(review):
        _, series, project_name, candidate_file = filename.split(os.sep)

        if project_name != 'TC':
            project_name = utils.dir2name(project_name, projects)

        if project_name in ['Stable branch Maintenance']:
            project_list = projects.values()
        else:
            project_list = [projects[project_name]]

        for project in project_list:
            for atc in project.get('extra-atcs', []):
                if (atc['email'] == owner['email'] and
                        utils.check_atc_date(atc)):
                    print("Valid extra ATC record:\n\t%s" % (atc))
                    found += 1
                    if found >= limit:
                        return True

            for deliverable in project['deliverables'].values():
                for repo_name in deliverable["repos"]:
                    query = ('is:merged after:"%s" before:"%s" '
                             'owner:%s project:%s' %
                             (utils.gerrit_datetime(utils.PERIOD_START),
                              utils.gerrit_datetime(utils.PERIOD_END),
                              owner['email'], repo_name))
                    print('Checking %s for merged changes by %s' %
                          (repo_name, owner['email']))
                    for review in utils.get_reviews(query):
                        url = ('%s/#/q/%s' %
                               (utils.GERRIT_BASE, review['change_id']))
                        print('%2d: %s %s' %
                              (found, pretty_datetime(review['submitted']),
                               url))
                        found += 1
                        if found >= limit:
                            return True
    return found > 0
