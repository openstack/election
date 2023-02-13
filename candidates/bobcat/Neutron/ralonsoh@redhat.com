Hello all:

I would like to announce my candidacy for the role of PTL of Neutron for
the Bobcat/2023.2 cycle.

Let me introduce myself first. I started contributing to OpenStack in
Liberty release (2015). I've contributed to several projects, mainly
Neutron, neutron-lib, os-ken and os-vif, in addition to Nova and
devstack. During the last two years I've been focused on the ML2/OVN
integration, QoS and Placement related features and helping on the
Neutron CI improvement and stabilization.

For this new release, those are the main goals I would like to focus
on:

* Continue with the improvement of CI stability. This has been a very high
  time consuming task for the Neutron community, but the improvements can
  be seen in the number of rechecks and CI time used by Neutron. We must
  continue with this effort during the next release.

* Keep working on the smart NIC / hardware offload testing. This is
  something I personally started during the last cycle but with little
  success, but we should continue with this effort.

* Keep working on the approved (or active) specs with active developments:
** Metadata rate limit (LP#1989199)
** Expose backend hints in the port API, hint ovs-tx-steering (LP#1990842)
** ML2/OVN IPv6 Distributed routing (LP#1998609)
** Active-active L3 Gateway with Multihoming (LP#2002687)
** Configurable Security Group rules added by default to the new Security
   Groups (LP#1983053)

Apart from those main goals, we should always keep an eye on:

* The SQLAlchemy 2.0 migration and any possible issue detected. During the
  last two releases we found and solved several issues related to the
  migration to SQLAlchemy 2.0. We need to keep watching for new possible
  issues.

* The Neutron's stadium ecosystem is alive and healthy: this is a
  permanent goal in any release. The Neutron ecosystem is wide and diverse
  and it is maintained with few resources. We should focus on those active
  projects and communities that support their respective repositories.

* Still closing (or surpassing) the ML2/OVS - ML2/OVN feature gap.

* The spec tracking and review, in order to continue adding new
  functionalities.


Thank you in advance.

Rodolfo Alonso Hernandez (ralonsoh, ralonsoh@redhat.com)
