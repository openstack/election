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

import datetime
import pytz
import yaml


TIME_FMT = "%b %d, %Y %H:%M %Z"
ISO_FMT = "%Y-%m-%dT%H:%M"


# Load configuration.yaml and create datetime objects
def parse_datetime(iso_format):
    date = datetime.datetime.strptime(iso_format, ISO_FMT)
    return date.replace(tzinfo=pytz.utc)


def load_conf():
    conf = yaml.safe_load(open('configuration.yaml'))
    conf['release'] = str(conf['release'])
    for key in ('start', 'end', 'email_deadline'):
        date = parse_datetime(conf['timeframe'][key])
        conf['timeframe'][key] = date
        conf['timeframe'][key+'_str'] = date.strftime(TIME_FMT)
    for event in conf['timeline']:
        for key in ('start', 'end'):
            date = parse_datetime(event[key])
            event[key] = date
            event[key+'_iso'] = date.strftime(ISO_FMT)
            event[key+'_str'] = date.strftime(TIME_FMT)
    return conf
