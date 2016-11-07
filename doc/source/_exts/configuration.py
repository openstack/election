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

"""Build configuration substitution
"""

import jinja2
import jinja2.environment
import os

from openstack_election.utils import conf


def build_configuration(app):
    output_file = os.path.join(".", "doc", "source", "configuration.rst")
    template_dir = os.path.join(".", "doc", "source", "_exts")
    loader = jinja2.FileSystemLoader(template_dir)
    env = jinja2.environment.Environment(trim_blocks=True, loader=loader)
    template = env.get_template("configuration.jinja")
    with open(output_file, "w") as out:
        out.write(template.render(conf))


def setup(app):
    app.info('loading configuration extension')
    app.connect('builder-inited', build_configuration)
