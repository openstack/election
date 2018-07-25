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

from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals

import testtools

from openstack_election.tests import fixtures as election_fixtures
import openstack_election.utils


class ElectionTestCase(testtools.TestCase):
    def setUp(self):
        """Run before each test method to initialize test environment."""
        super(ElectionTestCase, self).setUp()
        self.output = election_fixtures.OutputStreamCapture()
        self.useFixture(self.output)


class TestGerritUtils(ElectionTestCase):
    def test_candidate_files(self):
        review = {'revisions': {
                  'Ifake': {
                      'files': {
                          'some/file': {},
                          'candidates/some/file': {}}
                      }
                  }}

        self.assertEqual(openstack_election.utils.candidate_files(review),
                         ['candidates/some/file'])

    def test_name2dir(self):
        name = "nova"
        dirname = "Nova"
        self.assertEqual(dirname, openstack_election.utils.name2dir(name))
