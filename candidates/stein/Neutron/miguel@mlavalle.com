Hello OpenStackers,

I write this to submit my candidacy for Neutron PTL during the Stein cycle.
Being PTL of this project during the Queens and Rocky cycles has been the
highest honor of my career and I want to have another shot at the very
rewarding job of helping the community to deliver better networking
functionality in OpenStack.

We had a successful Rocky cycle, delivering on most of the goals we set for
ourselves in Dublin:

* Port forwardings for floating IPs was a feature under planning for several
  cycles. In Rocky we rolled up our sleeves and implemented it.
* We made the behavior of our API more consistent by properly handling filters
  in requests.
* We had an excellent cross project experience with Nova, implementing
  multiple port bindings to better support live instances migration.
* We made great progress moving generic DB functionality to neutron-lib and
  consuming it from Neutron and the Stadium projects.
* We extended the logging API to support FWaaS v2.0.

Moving forward, these are some of the goals that I propose for the team during
the Stein cycle:

* Conclude the implementation of bandwidth based scheduling, that will enable
  Neutron and Nova to guarantee network bandwidth to instances based on QoS
  policies.
* Implement DVR-aware announcement of fixed IPs in neutron-dynamic-routing.
* Continue extending Neutron QoS to support L3 router gateway IPs and VPN
  services.
* Conclude specifying and implement port mirroring for SR-IOV VF to VF
  mirroring.
* Extend the logging API to support SNAT.
* Improve the performance of port creation in bulk.
* Neutron makes extensive use of the Ryu library, which will not be supported
  by its implementor anymore. As decided in Vancouver, we will fork it and
  continue supporting it in the OpenStack community.
* We will continue our efforts of de-coupling common functionality from the
  Neutron repository and moving it to neutron-lib.
* With the recent departure of some of our contributors, we need to strengthen
  our team of core reviewers. I have recently been working with some of our
  team members towards this goal and will propose nominations in the up-coming
  cycle.

Thank you for your consideration and for taking the time to read this

Miguel Lavalle (mlavalle)
