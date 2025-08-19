Hello,

I would like to announce my candidacy to be Manila PTL for the 2026.1
(Gazpacho) cycle.

I have been contributing as Manila PTL for many cycles. It has been
awesome to work with this amazing community and help making this project
remain welcoming to contributors, operators, users and anyone that is putting
energy into maintaining Open Source software.

For the next cycle, I would like to continue what we have been doing as a
project, but also focus on:

* Tech debt: continue the efforts to get parity between Manila APIs
and Manila UI, complete the rootwrap->privsep migration.

* Eventlet: python-manilaclient is successfully migrated, and we will continue
the process for all other manila repositories.

* Closing the scenario testing gap for VirtioFS.

* Work with the contributors to ensure we have healthy testing jobs for first
and third party CI drivers.

Thank you for your consideration.

Carlos da Silva
IRC: carloss
