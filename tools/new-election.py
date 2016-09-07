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

import argparse
import os

from utils import get_projects, name2dir

parser = argparse.ArgumentParser()
parser.add_argument('name', help='The release cycle name')
parser.add_argument("--root", help='Election directory', default='.')
options = parser.parse_args()

os.chdir(options.root)
if not os.path.isdir("candidates"):
    print "candidates directory not found"
    exit(1)

if os.path.exists("candidates/%s" % options.name):
    print "candidates/%s: directory already exists" % options.name
    exit(1)

projects = get_projects()
project_list = projects.keys()
project_list.sort()
for project in project_list + ["TC"]:
    dpath = "candidates/%s/%s" % (options.name, name2dir(project))
    os.makedirs(dpath)
    open("%s/.placeholder" % dpath, "w").close()
    print "[+] Created %s" % dpath

print("Done. Now please manually update events.yaml and "
      "doc/source/index.rst substitutions")
