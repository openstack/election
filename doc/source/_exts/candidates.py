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

"""Build candidates list"""

import os
import yaml

from docutils import nodes
from docutils.parsers.rst import Directive
from docutils.statemachine import ViewList
import jinja2
import jinja2.environment
from sphinx.util import logging
from sphinx.util.nodes import nested_parse_with_titles

from openstack_election import series_sorting
from openstack_election import utils

LOG = logging.getLogger(__name__)


def render_template(template, data, **kwargs):
    template_dir = kwargs.get('template_dir', os.getcwd())
    loader = jinja2.FileSystemLoader(template_dir)
    env = jinja2.environment.Environment(trim_blocks=True, loader=loader)
    template = env.get_template(template)
    return template.render(data)


def render_list(list_type, candidates_list):
    output_file = os.path.join(".", "doc", "source", "%s.rst" % list_type)
    template_name = "%s.jinja" % list_type
    template_dir = os.path.join(".", "doc", "source", "_exts")
    with open(output_file, "wb") as out:
        LOG.info('writing list to %s', output_file)
        out.write(
            render_template(
                template_name,
                candidates_list,
                template_dir=template_dir
            ).encode('utf-8')
        )


def build_archive(serie, list_type):
    db_file = os.path.join(".", "doc", "source",
                           "results", serie, "%s.yaml" % list_type)
    if not os.path.isfile(db_file):
        return
    db = yaml.safe_load(open(db_file))
    # Check for appointed or incumbent footnote
    db['tc_seats'] = utils.conf['tc_seats']
    db['tags'] = {}
    for project in db['projects']:
        for candidate in db['candidates'][project]:
            if candidate['elected'] == 'TC-APPOINTED':
                db['tags']['TC-APPOINTED'] = True
            elif candidate['elected'] == 'INCUMBENT-PTL':
                db['tags']['INCUMBENT-PTL'] = True
            elif candidate['elected'] == 'LEADERLESS':
                db['tags']['LEADERLESS'] = True
    output = os.path.join(".", "doc", "source",
                          "results", serie, "%s.rst" % list_type)
    template_name = "%s_archive.jinja" % list_type
    template_dir = os.path.join(".", "doc", "source", "_exts")
    with open(output, "wb") as out:
        LOG.info('writing archive data to %s', output)
        out.write(
            render_template(
                template_name,
                db,
                template_dir=template_dir
            ).encode('utf-8')
        )
    output = os.path.join(".", "doc", "source",
                          "results", serie, "announce_%s.rst" % list_type)
    template_name = "%s_announce.jinja" % list_type
    with open(output, "wb") as out:
        out.write(
            render_template(
                template_name,
                db,
                template_dir=template_dir
            ).encode('utf-8')
        )
    return True


def build_lists(app):
    if utils.election_is_running():
        # Current candidates
        candidates_list = utils.build_candidates_list()
        election_type = utils.conf.get('election_type', '').lower()
        render_list(election_type, candidates_list)

    # Archived elections
    previous_toc = [
        ".. toctree::",
        "    :maxdepth: 1",
        "    :titlesonly:",
        ""
    ]
    archived_dir = os.path.join(".", "doc", "source", "results")
    dirs = sorted(os.listdir(archived_dir), key=series_sorting.keyfunc,
                  reverse=True)
    for previous in dirs:
        if build_archive(previous, "ptl"):
            previous_toc.append("    results/%s/ptl.rst" % previous)
        if build_archive(previous, "tc"):
            previous_toc.append("    results/%s/tc.rst" % previous)
    toc = os.path.join(".", "doc", "source", "archive_toc.rst")
    with open(toc, "w") as toc_fd:
        LOG.info('writing TOC to %s', toc)
        toc_fd.write("\n".join(previous_toc))


class CandidatesDirective(Directive):
    def run(self):
        if not utils.election_is_running():
            return []
        election_type = utils.conf.get('election_type', '').lower()

        rst = '.. include:: %s.rst' % (election_type)
        result = ViewList()
        for idx, line in enumerate(rst.splitlines()):
            result.append(line, 'CandidatesDirective', idx)
        node = nodes.paragraph()
        node.document = self.state.document
        nested_parse_with_titles(self.state, result, node)
        return node.children


def setup(app):
    LOG.info('loading candidates extension')
    app.connect('builder-inited', build_lists)
    app.add_directive('candidates', CandidatesDirective)
    return {'version': '0.1'}
