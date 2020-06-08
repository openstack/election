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

from unittest import mock

from openstack_election.cmds import ci_check_all_candidate_files
from openstack_election.tests import base
from openstack_election import utils


class TestFindModifiedCandidateFiles(base.ElectionTestCase):
    @mock.patch('subprocess.check_output')
    def test_find_modified_candidate_files_empty(self, mock_check_output):
        mock_check_output.return_value = b''
        filenames = \
            ci_check_all_candidate_files.find_modified_candidate_files()
        self.assertEqual([], filenames)

    @mock.patch('subprocess.check_output')
    def test_find_modified_candidate_files_new_election(self,
                                                        mock_check_output):
        check_output = (('configuration.yaml\n'
                         '%(path)s/.placeholder\n'
                         ) % ({'path': utils.CANDIDATE_PATH})).encode('utf-8')
        expected_filenames = []
        mock_check_output.return_value = check_output
        filenames = \
            ci_check_all_candidate_files.find_modified_candidate_files()
        self.assertEqual(expected_filenames, filenames)

    @mock.patch('subprocess.check_output')
    def test_find_modified_candidate_files_all_good(self, mock_check_output):
        check_output = (('configuration.yaml\n'
                         'openstack_election/__init__py\n'
                         '%(path)s/candidate\n'
                         '%(path)s/.placeholder\n'
                         ) % ({'path': utils.CANDIDATE_PATH})).encode('utf-8')
        expected_filenames = ['%s/candidate' % utils.CANDIDATE_PATH]
        mock_check_output.return_value = check_output
        filenames = \
            ci_check_all_candidate_files.find_modified_candidate_files()
        self.assertEqual(expected_filenames, filenames)
