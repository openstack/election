I want to propose my candidacy for Neutron PTL.

I have worked with OpenStack since the Havana release, first as a user and
operator and later on as an upstream developer mostly focused on Neutron. I was
appointed to the Neutron core team in the Queens cycle and joined the Neutron
Drivers last September. I participated very actively and led the QoS sub-team
and currently lead the project's CI group, focusing on identifying bugs and
keeping our gate jobs squeaky clean.

During my involvement with Neutron, I have been employed by an OpenStack
operator, OVH, and one of the big distributions, Red Hat. This experience
allows me to bring to the project a blend of operational and product
development perspective.

I think that my experience uniquely positions me to serve as an effective
Neutron PTL.

My priorities to focus on as a PTL are:

* I would like to continue the team effort on merging the ML2/OVS+DVR solution
  with networking-ovn - it is quite a new initiative, described in
  https://review.opendev.org/#/c/658414/ which I want to continue in the next
  cycle. OVN backend in OpenStack scales better than Neutron’s current default
  solution with openvswitch agent. It already have some features which we are
  missing in core Neutron, like DVR based on OpenFlow, enabling DVR for OVS DPDK.
  OVN is also becoming more prominent backend in e.g. Kubernetes and is more and
  more popular with OpenStack operators. I think that we should use this momentum
  and finally include OVN as one of in-tree backends in Neutron, and consider it
  as a default at some future point.

* Improve overall stability of our CI - we already did a lot of improvements in
  this area but I think that we must continue the effort in order to provide
  developers a great overall experience and the highest possible speed when
  working on new features.

* Improve test coverage for existing features - this is very important to avoid
  regressions and find bugs in existing features. Stability of existing Neutron
  features is very important for users and operators and we, as developers
  should focus on this maybe even more than on providing new features.

* Finish the transition to the new engine facade - it is a long standing
  blueprint already and we should focus to finally finish this transition and use
  the new engine facade everywhere in Neutron.

* Improve stability of Neutron when it is running under uWSGI - since a couple
  of cycles ago we have the possibility to run Neutron in this way but it is not
  the default yet. We have some CI jobs to test Neuton in this configuration but
  those jobs are non-voting and quite unstable still. So I would like to make
  those jobs more stable and voting.

I think that Miguel did a great job in the last four cycles as Neutron’s PTL
and I would like to continue his work and his way of managing the team, like
e.g. mentoring potential new core reviewers. I think that currently we have a
pretty stable and good team, with quite enough number of cores so my goal is to
keep it in good shape. Helping onboard new contributors is critical to the
growth and success of our community and will be a priority during my tenure.
