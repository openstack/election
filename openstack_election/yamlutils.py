# All Rights Reserved.
#
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

import ruamel.yaml
import ruamel.yaml.compat


def dumps(obj):
    """Dumps yaml content into a string."""
    yaml = ruamel.yaml.YAML()
    yaml.width = 80

    stream = ruamel.yaml.compat.StringIO()
    yaml.explicit_start = True
    yaml.indent(mapping=2, sequence=4, offset=2)
    yaml.dump(obj, stream)
    return stream.getvalue()


def loads(blob):
    """Load a yaml blob and retain key ordering."""
    yaml = ruamel.yaml.YAML()
    return yaml.load(blob)
