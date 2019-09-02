I am announcing my candidacy for Loci PTL. I have been involved with Loci since
very early in its development, and was part of the founding Core Team. Loci is a
project for packaging OpenStack projects into lightweight Docker images. Its'
core principle is to be both minimalistic and deployment tooling agnostic. Loci
is used by default in both OpenStack-Helm and StarlingX to deliver their
OpenStack services. We have a small team, a stable project, and low velocity,
but still, have several objectives to work towards in the next cycle. As PTL my
agenda would include improving testing, as currently, the only thing Loci tests
are builds without any functional or integration testing. We would also look at
ways to execute project tests, and Tempest integrated tests against a small
single-node deployment of OpenStack with Loci, and build tighter links, and
closer collaboration with upstream projects.

Thank you for support, and if elected I look forward to representing the Loci
team and the OpenStack community in the coming months.

Pete Birley (portdirect)
