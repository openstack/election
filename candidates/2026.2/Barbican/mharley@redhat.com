Hello, everyone.

I would like to announce my candidacy for PTL of the Barbican project for
the 2026.2 cycle.

This would be my second year of being PTL.  Over this time we've
continued to improve our codebase with bug fixes and appropriate
deprecations.

The project underwent significant modernization across all repositories:
the core removed eventlet dependency migrating to threading, adopted
oslo.middleware's RequestId, and stabilized CI jobs for Ubuntu Noble.
The python-barbicanclient added Python 3.12 support while dropping
Python 3.8 and obsolete dependencies. The barbican-ui fixed deprecated
Django APIs, and barbican-tempest-plugin aligned with the 2025.1 testing
runtime. Overall, the cycle focused on Python stack modernization, legacy
code cleanup, and CI stabilization.

Thank you for your appreciation.

Mauricio Harley (mharley)
