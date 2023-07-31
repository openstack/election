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
import datetime
import os
import sys
import textwrap

from openstack_election import config
from openstack_election import yamlutils

conf = config.load_conf()
rst_template = textwrap.dedent("""
    {release} TC and PTL Elections
    ---------------------------

    .. _{nrl}-election-email-deadline:

    {release} Election Email Deadline
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    Contributors that will be in the electorate for the upcoming election
    should confirm their gerrit email addresses by this date ({deadline_date}
    at {deadline_time} UTC). Electorate rolls are generated after this date and ballots will
    be sent to the listed gerrit email address.

    .. _{nrl}-election-nominations:

    {release} Election Nomination Begins
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    Candidates interested in serving for the next calendar year (TC), or
    development cycle (PTL) should announce their candidacies and platforms during
    this week.  Please see the `Election site`_ for specific timing information.

    .. _{nrl}-election-campaigning:

    {release} Election Campaigning Begins
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    The electorate has time to ask candidates questions about their platforms
    and debate topics before polling begins.  Please see the `Election site`_ for
    specific timing information.

    .. _{nrl}-election-voting:

    {release} Election Polling Begins
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    Election polling for open seats on the TC and any required PTL elections.
    Please see the `Election site`_ for specific timing information.

    .. _{nrl}-election-close:

    {release} Election Polling Ends
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    All polls close in the {release} Election and results announced.  Please see the
    `Election site`_ for specific timing information.

    .. _Election site: https://governance.openstack.org/election/
    """)  # noqa


def next_release_letter(release_name):
    ord_a = ord('a')
    next_ord = (ord(release_name[0]) - ord_a + 1) % 26
    next_letter = chr(ord_a + next_ord)
    return next_letter


def custom_strftime(format, t):
    def _suffix(d):
        return {1: 'st', 2: 'nd', 3: 'rd'}.get(d % 20, 'th')
    return t.strftime(format).replace('{S}', str(t.day) + _suffix(t.day))


def add_election_event_to_schedule(nrl, election_events,
                                   schedule_events, schedule_data):
    election_event_idx = 0
    for cycle_event in schedule_data["cycle"]:
        (cycle_event_start, cycle_event_end) = (
            datetime.date.fromisoformat(cycle_event["start"]),
            datetime.date.fromisoformat(cycle_event["end"]))
        event_type = election_events[election_event_idx]
        event_label = f"{nrl}-election-{event_type}"
        (event_start, event_end) = schedule_events[event_label]

        if cycle_event_start < event_start.date():
            continue

        if "x-project" not in cycle_event:
            cycle_event["x-project"] = []
        if event_label not in cycle_event["x-project"]:
            cycle_event["x-project"].append(event_label)

        if event_end.date() < cycle_event_end:
            election_event_idx += 1
        if election_event_idx >= len(election_events):
            break


def main():
    if conf["election_type"] != "combined":
        print("This tool currently only supports 'combined' elections",
              file=sys.stderr)
        return 1

    description = ('Update development cycle in openstack/releases with '
                   ' key election events')
    parser = argparse.ArgumentParser(description)
    parser.add_argument('--releases-repo', dest='releases_repo',
                        required=True,
                        help=('Path to a clone of the releases repo'))

    args = parser.parse_args()

    series_path = os.path.join(args.releases_repo, "data",
                               "series_status.yaml")
    with open(series_path) as f:
        series_data = yamlutils.loads(f)

    release = conf.get("release")
    release_name = series_data[0]["name"]
    nrl = next_release_letter(release_name)

    schedule_path = os.path.join(args.releases_repo, "doc", "source",
                                 release_name, "schedule.yaml")
    with open(schedule_path) as f:
        schedule_data = yamlutils.loads(f)

    rst_path = os.path.join(args.releases_repo, "doc", "source", release_name,
                            "schedule.rst")
    with open(rst_path) as f:
        rst = f.read()

    email_deadline = conf["timeframe"]["email_deadline"]
    deadline_date = custom_strftime('%B {S}, %Y', email_deadline)
    deadline_time = email_deadline.strftime("%H:%M")
    rst_blob = rst_template.format(**dict(release=release,
                                          nrl=nrl,
                                          deadline_time=deadline_time,
                                          deadline_date=deadline_date,))
    election_canary = rst_blob.split("\n")[1]
    if election_canary not in rst:
        print(f"Updating {rst_path} to add {rst_blob}\n")
        with open(rst_path, "w") as f:
            f.write(rst)
            f.write(rst_blob)

    schedule_events = {f"{nrl}-election-close":
                       (conf["timeframe"]["end"], conf["timeframe"]["end"]),
                       f"{nrl}-election-email-deadline":
                       (email_deadline, email_deadline), }
    for event in conf["timeline"]:
        event_type = event["name"].split()[-1].lower()
        if event_type == "election":
            event_type = "voting"
        event_label = f"{nrl}-election-{event_type}"
        schedule_events[event_label] = (event["start"], event["end"])

    election_events = ["email-deadline"]
    add_election_event_to_schedule(nrl, election_events, schedule_events,
                                   schedule_data)
    election_events = ["nominations", "campaigning", "voting", "close"]
    add_election_event_to_schedule(nrl, election_events, schedule_events,
                                   schedule_data)

    with open(schedule_path, "w") as f:
        print(f"Updating {schedule_path}")
        f.write(yamlutils.dumps(schedule_data))
