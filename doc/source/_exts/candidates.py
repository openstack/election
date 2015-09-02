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

from jinja2 import FileSystemLoader
from jinja2.environment import Environment

BASE_URL = "http://git.openstack.org/cgit/openstack/election"
PATH_PREFIX = 'candidates'


def render_template(template, data, **kwargs):
    template_dir = kwargs.get('template_dir', os.getcwd())
    loader = FileSystemLoader(template_dir)
    env = Environment(trim_blocks=True, loader=loader)
    template = env.get_template(template)
    return template.render(data)


def build_candidates_list(election):
    project_list = os.listdir(os.path.join(PATH_PREFIX, election))
    project_list.sort()

    candidates_lists = {}
    for project in project_list:
        project_prefix = os.path.join(PATH_PREFIX, election, project)
        candidates_list = filter(
            lambda x: x.endswith(".txt"),
            os.listdir(unicode(project_prefix)),
        )
        candidates_list = [os.path.join(project_prefix, c)
                           for c in candidates_list]
        candidates_list.sort()
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
    # TODO: make mitaka a parameter
    election = 'mitaka'
    candidates_list = build_candidates_list(election)
    render_list("ptl", candidates_list)
    render_list("tc", candidates_list)


def setup(app):
    app.info('loading candidates extension')
    app.connect('builder-inited', build_lists)
