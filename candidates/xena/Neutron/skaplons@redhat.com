I want to propose my candidacy for Neutron PTL in the Xena cycle.

Wallaby was my third cycle serving as Neutron PTL. I think I helped to keep the
project in a healthy state and I would like to continue serving as the PTL and
keep Neutron running well in the Xena cycle.

In Wallaby we accomplished many important goals like e.g.:
* finished migration to the engine facade,
* improve our CI jobs and its overall stability,
* and close of many feature parity gaps between OVN and OVS backends.

But we also didn't finish some of the goals which were set for that cycle, like
e.g. switching OVN to be the default Neutron backend in Devstack.

If I will be elected, I would like to set it as my main goal for Xena cycle.
We did a lot of work on adoption of the OVN backend in Neutron already and I
think that we are now ready to move on and switch it to be the default backend
in the Devstack.
I want to focus on couple of things in the Xena cycle:
* reduce our bug backlog as it is huge now,
* maintenance and continue improvements of our CI, as this is "never ending story",
* keep Neutron running in a smooth way.

As I mentioned above, if I will be elected, Xena will be my 4th cycle as Neutron
PTL and I would like to find some potential successors for the next cycles to
help them onboard and understand what are the duties and responsibilities of the
PTL.

Slawek Kaplonski
irc: slaweq
