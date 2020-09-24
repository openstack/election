I want to propose my candidacy and continue serving as Neutron PTL in the
Wallaby cycle.

In the Victoria cycle I proposed a couple of major goals. We achieved most of
them, like for example:
* add support for metadata over IPv6 in Neutron,
* continue adoption of the OVN driver as one of the in-tree Neutron drivers.
* find new maintainers for the networking-midonet project so we keep it the
* Neutron stadium.

In the upcoming cycle I would like to continue work which we started already and
focus mostly on:
* implement old, unfinished Blueprints like adoption of new engine facade,
* continue adoption of the OVN backend in Neutron, closing more feature parity
* gaps
* switch the OVN driver to be the default backend in Devstack,

In addition to the goals mentioned above mentioned, I want to continue work to
improve our CI stability and coverage.
It is my continuing desire to do my best to help our outstanding team to deliver
better software and to grow.

Slawek Kaplonski
irc: slaweq
