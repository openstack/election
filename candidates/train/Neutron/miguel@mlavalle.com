Hello OpenStackers,

I write this to submit my candidacy for Neutron PTL during the Train cycle.
I have had a blast being the project's PTL for the past three cycles. After
everything is said and done, the most rewarding part of this job is to get to
work with an amazing group of top notch software engineers from around the
World. I will be grateful forever for everything that you all have taught me.
So I humbly ask for another chance to be trained during Train.

We had a successful Stein cycle, delivering on most of the goals we set for
ourselves in Denver:

* Delivered most of the implementation of bandwidth based scheduling, that
  enables Neutron and Nova to guarantee network bandwidth to instances based
  on QoS policies.
* To better serve edge computing use cases, we partnered with the StarlingX
  team to implement management of network segments ranges dynamically through a
  new API extension.
* Extended Neutron QoS to support L3 router gateway IPs.
* Improved the performance of port creation in bulk to better support
  containers use cases.
* Improved the security groups implementation by optimizing the performance of
  rules creation and making security groups shareable with the RBAC mechanism.
* We created the os-ken project, OpenStack community fork of the Ryu library,
  which will not be supported by its original implementor anymore. os-ken is
  now maintained by the Neutron project team.
* We continued our efforts of de-coupling common functionality from the Neutron
  repository and moving it to neutron-lib.
* We worked hard on past and present community goals, so at the end of Stein
  Neutron will be completely caught up.
* We implemented a successful mentoring program for prospective core reviewers.
  This enabled us to add three new members to the Neutron team: Nate Johnston,
  Hongbin Lu and Liu Yulong. We also added Bernard Cafarelli, Ryan Tidwell and
  Manuel Buil as stable branches, BGP Dynamic Routing and networking-sfc core
  reviewers, respectively.

Moving forward, these are some of the goals that I propose for the team during
the Train cycle:

* Improve the usability of routed networks by allowing more that one segment
  per network per compute host. This will enable the scaling up of deployments
  without being constrained by subnet IP address ranges.
* Add the capabillity to tag ports during bulk creation, to better support
  containers use cases.
* Actively continue our collaboration with the StarlingX team to identify and
  implement better support for edge computing use cases.
* Continue the implementation of smart NICs support.
* During Stein, we formed a performance sub-team with the aim of improving
  Neutron's scalability. We will bring this effort to fruition by identifying
  and implementing areas of improvement based on the characterization work we
  are doing with osprofiler and the EnOS (Experimental eNvironment for
  OpenStack) team.
* We will continue our efforts of de-coupling common functionality from the
  Neutron repository and moving it to neutron-lib.
* I see myself, with the support of my current employer, actively involved in
  the project and the community for many cycles in the future. I think, though,
  that we are getting to a point where it is healthy to pass the baton to a new
  leader. To that end, I will actively encourage team members to step up to the
  plate in the next cycle. I will support and help propective candidates every
  step of the way.

Thank you for your consideration and for taking the time to read this

Miguel Lavalle (mlavalle)
