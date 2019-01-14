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

import mock

from openstack_election import exception
from openstack_election.tests import base
from openstack_election import utils


class TestGerritUtils(base.ElectionTestCase):
    def test_candidate_files(self):
        review = {'revisions': {
                  'Ifake': {
                      'files': {
                          'some/file': {},
                          'candidates/some/file': {}}
                      }
                  }}

        self.assertEqual(utils.candidate_files(review),
                         ['candidates/some/file'])

    def test_name2dir(self):
        name = "nova"
        dirname = "Nova"
        self.assertEqual(dirname, utils.name2dir(name))


class TestFindCandidateFiles(base.ElectionTestCase):
    @mock.patch.object(utils, 'is_tc_election', return_value=False)
    @mock.patch('os.path.exists', return_value=True)
    @mock.patch('os.listdir', side_effect=[['SomeProject', 'TC'],
                                           ['invalid@example.com']])
    def test_ptl_lists(self, mock_listdir, mock_path_exists,
                       mock_is_tc_election):
        candidate_files = utils.find_candidate_files(election='fake')
        self.assertEqual(['candidates/fake/SomeProject/invalid@example.com'],
                         candidate_files)

    @mock.patch.object(utils, 'is_tc_election', return_value=True)
    @mock.patch('os.path.exists', return_value=True)
    @mock.patch('os.listdir', side_effect=[['SomeProject', 'TC'],
                                           ['invalid@example.com']])
    def test_tc_lists(self, mock_listdir, mock_path_exists,
                      mock_is_tc_election):
        candidate_files = utils.find_candidate_files(election='fake')
        self.assertEqual(['candidates/fake/TC/invalid@example.com'],
                         candidate_files)


class TestBuildCandidatesList(base.ElectionTestCase):
    @mock.patch.object(utils, 'lookup_member')
    @mock.patch.object(utils, 'find_candidate_files')
    def test_invalid_candidate(self, mock_candidates_list, mock_lookup_member):
        mock_candidates_list.return_value = [
            'candidates/fake/SomeProject/invalid@example.com'
        ]
        mock_lookup_member.return_value = dict(data=[])

        self.assertRaises(exception.MemberNotFoundException,
                          utils.build_candidates_list,
                          'fake')

    @mock.patch.object(utils, 'lookup_member')
    @mock.patch.object(utils, 'find_candidate_files')
    def test_valid_candidate(self, mock_candidates_list, mock_lookup_member):

        mock_candidates_list.return_value = [
            'candidates/fake/SomeProject/invalid@example.com'
        ]
        member = dict(irc='ircnick',
                      first_name='Avery',
                      last_name='Developer')
        mock_lookup_member.return_value = dict(data=[member])

        expected = dict(candidates=mock.ANY, election='fake',
                        projects=['SomeProject'])
        observed = utils.build_candidates_list('fake')
        self.assertEqual(expected, observed)
