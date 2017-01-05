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

import os

from openstack_election import utils


def main():
    if not os.path.isdir("candidates"):
        print("candidates directory not found")
        exit(1)

    base_dir = "candidates/%s" % utils.conf['release']
    projects = utils.get_projects()
    project_list = list(projects.keys())
    project_list.sort()
    for project in project_list + ["TC"]:
        dpath = "%s/%s" % (base_dir, utils.name2dir(project))
        if not os.path.exists(dpath):
            os.makedirs(dpath)
            open("%s/.placeholder" % dpath, "w").close()
            print("[+] Created %s" % (dpath))
