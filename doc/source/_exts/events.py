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

"""Add election timer data
"""

import os
import calendar
import time

from jinja2 import FileSystemLoader
from jinja2.environment import Environment

from openstack_election import utils


def build_timer(app):
    app.add_javascript("event_timer.js")
    # add better text for tabulatted planning
    now = time.time()
    outdated = '*'
    for ev in utils.conf['timelines']:
        d, h = ev['date'].split('T')
        epoch_time = calendar.timegm(
            time.strptime(ev['date'], "%Y-%m-%dT%H:%M"))
        ev['status'] = 'past'
        if epoch_time > now:
            if outdated == '*':
                # Mark upcoming event as bold
                ev['status'] = 'current'
                outdated = '**'
            else:
                ev['status'] = 'future'
                outdated = ''
        ev['date_str'] = "%s%s, %s UTC%s" % (outdated, d, h, outdated)
        ev['name_str'] = "%s%s%s" % (outdated, ev['name'], outdated)
    output_file = os.path.join(utils.CANDIDATE_PATH, "events.rst")
    with open(output_file, "w") as out:
        template_dir = os.path.join(".", "doc", "source", "_exts")
        loader = FileSystemLoader(template_dir)
        env = Environment(trim_blocks=True, loader=loader)
        template = env.get_template("events.jinja")
        out.write(template.render({'events': utils.conf['timelines']}))


def setup(app):
    app.info('loading events_timer extension')
    app.connect('builder-inited', build_timer)
