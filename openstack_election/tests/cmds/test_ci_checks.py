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

import os
import textwrap
import yaml

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

    @mock.patch('os.path.exists', return_value=True)
    @mock.patch('subprocess.check_output')
    def test_find_modified_candidate_files_all_good(
            self, mock_check_output, mock_path_exists):
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


class TestValidateProject(base.ElectionTestCase):
    projects_str = textwrap.dedent("""
                    ---
                    project:
                      ptl:
                          name: PTL Name
                          email: ptl@example.com
                          irc: ptl_nic
                    distributed_project:
                      leadership_type: distributed
                    """)
    fake_projects = yaml.safe_load(projects_str)

    def test_ptl_project(self):
        file_path = os.path.join("...", utils.CANDIDATE_PATH,
                                 "project/candidate@email")
        is_ok = \
            ci_check_all_candidate_files.validate_project(file_path,
                                                          self.fake_projects)

        self.assertTrue(is_ok)

    # A project with a "distributed" leadership_type should not have
    # candidates
    def test_distributed_project(self):
        file_path = os.path.join("...", utils.CANDIDATE_PATH,
                                 "distributed_project/candidate@email")
        is_ok = \
            ci_check_all_candidate_files.validate_project(file_path,
                                                          self.fake_projects)

        self.assertFalse(is_ok)

# TODO(tonyb): Add more validate_* tests here
