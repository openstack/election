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

import datetime
import jinja2
import jinja2.environment
import os
import pytz

from openstack_election import utils


def build_timer(app):
    app.add_javascript("event_timer.js")
    now = datetime.datetime.utcnow().replace(tzinfo=pytz.utc)
    first_event = True
    for ev in utils.conf['timeline']:
        if ev['start'] > now:
            ev['status'] = 'future'
        elif ev['end'] > now:
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

        ev['start_iso'] = ev['start'].strftime("%Y-%m-%dT%H:%M")
        ev['end_iso'] = ev['end'].strftime("%Y-%m-%dT%H:%M")
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
