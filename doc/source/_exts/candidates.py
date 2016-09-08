#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

"""Build candidates list
"""

import os
import subprocess

from jinja2 import FileSystemLoader
from jinja2.environment import Environment

BASE_URL = "http://git.openstack.org/cgit/openstack/election"
PATH_PREFIX = 'candidates'


def get_fullname(filepath, exceptions):
    if filepath in exceptions:
        return exceptions[filepath]
    return subprocess.Popen(["git", "log", "--format=%aN", filepath],
                            stdout=subprocess.PIPE).stdout.readlines()[-1][:-1]


def render_template(template, data, **kwargs):
    template_dir = kwargs.get('template_dir', os.getcwd())
    loader = FileSystemLoader(template_dir)
    env = Environment(trim_blocks=True, loader=loader)
    template = env.get_template(template)
    return template.render(data)


def build_candidates_list(election):
    project_list = os.listdir(os.path.join(PATH_PREFIX, election))
    project_list.sort()
    exceptions = {}
    for e in open("exceptions.txt").readlines():
        if e[0] == "#" or ":" not in e:
            continue
        exceptions[e.split(':')[0]] = " ".join(e.split(':')[1:])[:-1].strip()

    candidates_lists = {}
    for project in project_list:
        project_prefix = os.path.join(PATH_PREFIX, election, project)
        file_list = filter(
            lambda x: x.endswith(".txt"),
            os.listdir(unicode(project_prefix)),
        )
        candidates_list = []
        for candidate_file in file_list:
            filepath = os.path.join(project_prefix, candidate_file)
            candidates_list.append(
                {
                    'path': filepath,
                    'ircname': os.path.basename(filepath)[:-4],
                    'fullname': get_fullname(filepath, exceptions)
                })

        candidates_list.sort(key=lambda x: x['fullname'])
        candidates_lists[project] = candidates_list

    return {'election': election,
            'projects': project_list,
            'candidates': candidates_lists}


def render_list(list_type, candidates_list):
    output_file = os.path.join(PATH_PREFIX, "%s.rst" % list_type)
    template_name = "%s.jinja" % list_type
    template_dir = os.path.join(".", "doc", "source", "_exts")
    with open(output_file, "w") as out:
        out.write(
            render_template(
                template_name,
                candidates_list,
                template_dir=template_dir
            ).encode('utf-8')
        )


def build_lists(app):
    # TODO: make election a parameter
    election = 'ocata'
    candidates_list = build_candidates_list(election)
    render_list("ptl", candidates_list)
    render_list("tc", candidates_list)


def setup(app):
    app.info('loading candidates extension')
    app.connect('builder-inited', build_lists)
