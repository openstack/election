Hello again,

I would like to submit my candidacy to continue as the PTL of Keystone. We've
had another productive cycle and I feel that the Keystone project is in a very
good place with active meetings, a healthy review cycle and quality code
contributions from a diverse community. We're making strides in modernizing our
codebase by migrating to black [1] as our code formatter [2] and we're adding
support for OpenAPI Schema Support [3], which is really exciting.

These are just a few of the things we've been working on this cycle and I'm
excited for the next. If you're interested in all things identity we can always
use the help and we're happy to show you the ropes :) 

Thanks for your time and support,

/Dave

[1]: https://pypi.org/project/black/
[2]: https://review.opendev.org/q/topic:%22renovate%22
[3]: https://review.opendev.org/q/topic:%22openapi%22+and+(project:openstack/keystone+or+project:openstack/python-keystoneclient+or+project:openstack/keystoneauth+or+project:openstack/keystonemiddleware+or+project:openstack/pycadf+or+project:openstack/ldappool)


