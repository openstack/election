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
import urllib

from jinja2 import FileSystemLoader
from jinja2.environment import Environment

from openstack_election import utils


def render_template(template, data, **kwargs):
    template_dir = kwargs.get('template_dir', os.getcwd())
    loader = FileSystemLoader(template_dir)
    env = Environment(trim_blocks=True, loader=loader)
    template = env.get_template(template)
    return template.render(data)


def render_list(list_type, candidates_list):
    output_file = os.path.join(utils.CANDIDATE_PATH, "%s.rst" % list_type)
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
    candidates_list = utils.build_candidates_list()
    render_list("ptl", candidates_list)
    render_list("tc", candidates_list)


def setup(app):
    app.info('loading candidates extension')
    app.connect('builder-inited', build_lists)
