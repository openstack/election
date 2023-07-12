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
import enum
import os
from pprint import pprint  # noqa

from openstack_election import config
from openstack_election import utils
from openstack_election import yamlutils
import ruamel.yaml
from ruamel.yaml.comments import CommentedMap

conf = config.load_conf()


class TC_Status(enum.Enum):
    CANDIDATE = 0
    EXISTING = 1
    EXPIRED = 2
    ELECTED = 3


def load_election_results(election):
    ptl_results_fname = os.path.join(".", "doc", "source", "results",
                                     election, "ptl.yaml")
    ptl_data = yamlutils.load(ptl_results_fname)
    print("PTL data loaded")

    tc_results_fname = os.path.join(".", "doc", "source", "results",
                                    election, "tc.yaml")
    tc_data = yamlutils.load(tc_results_fname)
    print("TC data loaded")

    return {"ptl": ptl_data, "tc": tc_data["candidates"]["TC"]}


def load_projects(projects_fname):
    return yamlutils.load(projects_fname)


def write_projects(projects_fname, projects):
    # FIXME: Extract the rumel code from _write_tc and use here.
    with open(projects_fname, "w") as f:
        f.write(yamlutils.dumps(projects))


def update_projects(projects, results):
    project_count_ptl = 0
    project_count_leaderless = 0
    project_count_distributed = 0
    for project_name in projects:
        dir_name = utils.name2dir(project_name)
        ptl = projects[project_name].get("ptl", {})
        leadership_type = projects[project_name].get("leadership_type")
        if dir_name in results["ptl"]["candidates"]:
            elected_ptl = results["ptl"]["candidates"][dir_name][0]
            ptl["name"] = elected_ptl["fullname"] or ptl["name"]
            ptl["irc"] = elected_ptl["ircname"] or ptl["irc"]
            ptl["email"] = elected_ptl["email"] or ptl["email"]
            project_count_ptl += 1
        elif dir_name in results["ptl"]["leaderless"]:
            ptl["name"] = "APPOINTMENT NEEDED"
            ptl["irc"] = "No nick supplied"
            ptl["email"] = "example@example.org"
            print(f"leaderless project: {project_name}")
            project_count_leaderless += 1
        elif leadership_type in ["distributed"]:
            print(f"{leadership_type} leadership type: {project_name}")
            project_count_distributed += 1
        else:
            print(f"{project_name} is Unknown to the election tooling")

    print("==================================")
    print(f"Processed - {project_count_ptl} PTLs")
    print(f"Leaderless projects: {project_count_leaderless}")
    print(f"Distributed leadership projects: {project_count_distributed}")


def load_tc_members(tc_members_fname):
    return yamlutils.load(tc_members_fname)


def write_tc_members(tc_members_fname, tc_members):
    def none_representer(dumper, data):
        return dumper.represent_scalar('tag:yaml.org,2002:null', 'null')

    # This is copied from the governance/yamltools.py
    yaml = ruamel.yaml.YAML(typ='rt')
    yaml.width = 256
    yaml.allow_duplicate_keys = True
    yaml.representer.add_representer(type(None), none_representer)
    yaml.indent(mapping=2, sequence=4, offset=2)
    yaml.Constructor.add_constructor(
        '!encrypted/pkcs1-oaep',
        ruamel.yaml.SafeConstructor.construct_yaml_seq,
    )

    with open(tc_members_fname, "w") as f:
        yaml.dump(tc_members, f)


def update_tc_members(tc_members, results):
    now = datetime.datetime.now().date()
    memberid_map = {}

    for tc_member in tc_members:
        memberid = tc_member["memberid"]
        memberid_map[memberid] = tc_member

        date = datetime.datetime.strptime(tc_member["date"], "%B %Y").date()
        tc_status = TC_Status.EXISTING
        # Find candidates that were elected more than 10 months ago
        # Using 40 weeks incase the election schedules are off by a little.
        if (now - date) > datetime.timedelta(weeks=40):
            # We don't remove them at this stage as it's possible an existing
            # TC member will be re-elected so flag them and remoev them later
            # if needed
            tc_status = TC_Status.EXPIRED
        tc_member["tc_status"] = tc_status
        tc_member["role"] = None

    for candidate in results["tc"]:
        if not candidate["elected"]:
            continue
        tc_status = TC_Status.ELECTED
        memberid = utils.lookup_member(candidate["email"])["data"][0]["id"]
        if memberid in memberid_map:
            memberid_map[memberid]["date"] = now.strftime("%B %Y")
            memberid_map[memberid]["tc_status"] = tc_status
        else:
            member = CommentedMap()
            member["name"] = candidate["fullname"]
            member["irc"] = candidate["ircname"]
            member["email"] = candidate["email"]
            member["memberid"] = memberid
            member["date"] = now.strftime("%B %Y")
            member["role"] = None
            member["tc_status"] = tc_status
            tc_members.append(member)

    # Mutate the existing list to remove the expired TC members
    tc_members[:] = [m for m in tc_members if m["tc_status"] != TC_Status.EXPIRED]  # noqa E501

    # The TC members file has elements separated by blank lines.
    # This preserves that to reduce the diff.
    blank_line = ruamel.yaml.tokens.CommentToken('\n\n',
                                                 ruamel.yaml.error.CommentMark(10),  # noqa E501
                                                 None)
    for member in tc_members:
        member.ca.items['role'] = [None, None, blank_line, None]
        # Remove the synthetic tc_status element as we don't need that written
        # to disk
        del member["tc_status"]
    # Also, remove the last blank line.
    del member.ca.items['role']


def main():
    description = ("Update openstack/gorernance:reference/projects.yaml "
                   " with the new PTL details")
    parser = argparse.ArgumentParser(description)
    parser.add_argument("--governance-repo", dest="governance_repo",
                        required=True,
                        help=("Path to a clone of the governance repo"))
    parser.add_argument("--election-name", dest="election",
                        default=conf["release"],
                        help=("Election name or  "
                              "default: '%(default)s' value  "
                              "from the configuration.yaml will be used"))

    args = parser.parse_args()
    results = load_election_results(args.election)

    projects_fname = os.path.join(os.path.expanduser(args.governance_repo),
                                  "reference", "projects.yaml")
    projects = load_projects(projects_fname)
    update_projects(projects, results)
    write_projects(projects_fname, projects)

    tc_members_fname = os.path.join(os.path.expanduser(args.governance_repo),
                                    "reference", "members.yaml")
    tc_members = load_tc_members(tc_members_fname)
    update_tc_members(tc_members, results)
    write_tc_members(tc_members_fname, tc_members)
    return 0
