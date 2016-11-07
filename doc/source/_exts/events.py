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

import calendar
import jinja2
import jinja2.environment
import os
import time

from openstack_election import utils


def build_timer(app):
    app.add_javascript("event_timer.js")
    now = time.time()
    first_event = True
    for ev in utils.conf['timeline']:
        ds, hs = ev['start'].split('T')
        de, he = ev['end'].split('T')
        start_time = calendar.timegm(
            time.strptime(ev['start'], "%Y-%m-%dT%H:%M"))
        end_time = calendar.timegm(
            time.strptime(ev['end'], "%Y-%m-%dT%H:%M"))

        if start_time > now:
            ev['status'] = 'future'
        elif end_time > now:
            ev['status'] = 'current'
        else:
            ev['status'] = 'past'

        if first_event and ev['status'] == 'future':
            ev['status'] = 'next'
            first_event = False

        mark = ''
        if ev['status'] == 'current':
            mark = '**'
        elif ev['status'] == 'past':
            mark = '*'

        ev['start_str'] = "%s%s, %s UTC%s" % (mark, ds, hs, mark)
        ev['end_str'] =   "%s%s, %s UTC%s" % (mark, de, he, mark)
        ev['name_str'] = "%s%s%s" % (mark, ev['name'], mark)
    output_file = os.path.join(".", "doc", "source", "events.rst")
    with open(output_file, "w") as out:
        template_dir = os.path.join(".", "doc", "source", "_exts")
        loader = jinja2.FileSystemLoader(template_dir)
        env = jinja2.environment.Environment(trim_blocks=True, loader=loader)
        template = env.get_template("events.jinja")
        out.write(template.render({'events': utils.conf['timeline']}))


def setup(app):
    app.info('loading events_timer extension')
    app.connect('builder-inited', build_timer)
