Hi All,


I'd like to announce my candidacy for PTL of Storlets for the z release cycle,
continuing the role from past several cycles.

The biggest change we're expecting for this cycle is removal of Python 2
support, following the same in Swift, which was recently announced[1].
We don't expect any challenges at this moment as Storlets has been fully
complatble with Python 3 for several cycles, but the remaining work to clean
up items left to keep Python 2 support (Python 2 jobs, for example) is our
priority.

[1] http://lists.openstack.org/pipermail/openstack-discuss/2022-January/026925.html

Thank you for your consideration.

Thank you,
Takashi
