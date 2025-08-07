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


class ElectionException(Exception):
    """Base Election Exception

    To correctly use this class, inherit from it and define
    a 'msg_fmt' property. That msg_fmt will get printf'd
    with the keyword arguments provided to the constructor.

    """
    msg_fmt = 'An unknown exception occurred.'

    def __init__(self, message=None, **kwargs):
        self.kwargs = kwargs

        if not message:
            message = self.msg_fmt % kwargs

        self.message = message
        super(ElectionException, self).__init__(message)


class MemberNotFoundException(ElectionException):
    msg_fmt = ('No Open Infrastructure Foundation (OIF) data found for'
               '%(email)s please check that %(email)s is a valid email address'
               ' and linked to a valid OIF account')
