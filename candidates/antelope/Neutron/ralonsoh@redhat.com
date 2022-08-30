Hello all:

I would like to announce my candidacy for the role of PTL of Neutron for
the Antelope cycle.

Let me introduce myself first. I started contributing to OpenStack in
Liberty release (2015). I've contributed to several projects, mainly
Neutron, neutron-lib, os-ken and os-vif, in addition to Nova and
devstack. During the last two years I've been focused on the ML2/OVN
integration, QoS and Placement related features and helping on the
Neutron CI improvement and stabilization.

For this new release, those are the main goals I would like to focus
on:

* Take care and focus on the approved and merged Neutron specs [1].
  Those RFEs should be actively attended by the community, from the spec
  proposal to the code review. In order to increase the attention of the
  community on these new RFEs, new ways of tracking them should be proposed
  (a topic that should be discussed during the PTG). For example, having a
  core reviewer “godfather” for each RFE.

* Continue with the improvement of CI stability. The job done during the
  last 2 or 3 releases has been impressive, probably the hardest and the most
  continued effort on the CI in the Neutron community ever. We *must*
  continue with this effort and the current processes to track the
  healthiness of the CI.

* Start working on the smart NIC / hardware offload testing. The number of
  backends (ML2/OVS, ML2/OVN, ML2/SR-IOV) make non-viable to test any
  possible combination. But at least, depending on the available hardware,
  we would be able to test the stability of those backends with the newest
  hardware offload NICs. Note: that will imply an external CI support.

* Work with users and operators, providing an active channel with them. The
  goal is to attract customers to be actively involved in the community,
  participating in the Neutron meetings (team meeting, CI meeting, drivers
  meeting) or even creating a specific meeting with them in order to capture
  new needs or issues.

* Live migration improvement, specially in ML2/OVN. This feature is still
  being tested and has not proven to be very stable. There are several core
  OVN and Neutron efforts right now but we still need to make this feature
  stable enough to be delivered to customers.


A part from those main goals, we should always keep an eye on:

* The SQLAlchemy 2.0 migration and any possible issue detected.

* The Neutron's stadium ecosystem alive and healthy: this is a permanent
  goal in any release. The Neutron ecosystem is wide and diverse and it is
  maintained with few resources. We should focus on those active projects
  and communities that support their respective repositories.

* Still closing the ML2/OVS - ML2/OVN feature gap, that is smaller every
  cycle.


Thank you in advance.

Rodolfo Alonso Hernandez (ralonsoh, ralonsoh@redhat.com)
