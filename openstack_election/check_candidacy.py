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

from openstack_election import utils


# FIXME: Printing from library function isn't great.
#        change API to return the messages and let the consumer decide what to
#        do with them
def check_candidate(project_name, email, projects, limit=1):
    def pretty_datetime(dt_str):
        dt = datetime.datetime.strptime(dt_str.split('.')[0],
                                        '%Y-%m-%d %H:%M:%S')
        return dt.strftime('%Y-%m-%d')

    found = 0
    branch = None

    if project_name in ['Stable branch maintenance']:
        project_list = projects.values()
        branch = '^stable/.*'
    else:
        project_list = [projects[project_name]]

    for project in project_list:
        for atc in project.get('extra-atcs', []):
            if (atc['email'] == email and utils.check_atc_date(atc)):
                print("%2d: Valid extra ATC record:\n\t%s" % (found, atc))
                found += 1
                if found >= limit:
                    return found

        for deliverable in project['deliverables'].values():
            for repo_name in deliverable["repos"]:
                query = ('is:merged after:"%s" before:"%s" '
                         'owner:%s project:%s' %
                         (utils.gerrit_datetime(utils.PERIOD_START),
                          utils.gerrit_datetime(utils.PERIOD_END),
                          email, repo_name))
                if branch:
                    query += (' branch:%s' % (branch))
                print('Checking %s for merged changes by %s' %
                      (repo_name, email))
                for review in utils.get_reviews(query):
                    url = ('%s/%s/commit/?id=%s' % (
                            utils.CGIT_URL, review['project'],
                            review['current_revision']))
                    print('%2d: %s %s' %
                          (found, pretty_datetime(review['submitted']),
                           url))
                    found += 1
                    if found >= limit:
                        return found
    return found


def check_candidacy_review(change_id, limit=1, tag=utils.PROJECTS_TAG,
                           review=None):
    projects = utils.get_projects(tag=tag)
    # If there is more than one review that matches this change_id then all
    # bets are off
    review = review or utils.get_reviews(change_id)[0]
    email = review.get('owner', {}).get('email')
    found = 0

    for filename in utils.candidate_files(review):
        _, series, project_name, candidate_file = filename.split(os.sep)
        if project_name != 'TC':
            project_name = utils.dir2name(project_name, projects)

        found += check_candidate(project_name, email, projects,
                                 limit=(limit-found))
        if found >= limit:
            return True

    return found > 0
