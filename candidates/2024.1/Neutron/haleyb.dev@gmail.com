Hello Openstack Community,

I am writing to submit my candidacy for the Neutron PTL position
during the 2024.1 cycle.

I have worked on Openstack since Diablo (2011), starting as a cloud
operator doing L2 overlay development, along with agent performance
and scalability on large-scale deployments. During that time I've
become a core contributor (2015) and been part of the team making
sure our stable branches continue to receive all the back-ports
necessary to make downstream consumption easier. I currently work
for Canonical in their Sustaining Engineering group, primarily
addressing customer issues, with a focus on processes and tools
to help us more quickly solve them.

My priorities as PTL would be the following:

* Always make sure the stable branches are consumable downstream.
  Distros and operators are, in my opinion, the lifeblood of Openstack,
  so we have to make sure they are top of mind when fixing bugs, and
  that back-ports are done in a timely manner.

* Continue pursuing CI stability. During the past 6+ cycles the
  Neutron community has done a great job keeping its CI healthy, as well
  as actively updating jobs to make sure we use resources wisely and
  reduce re-checks.

* Keep working on, or complete, ongoing specs. There are a number of
  larger specs that have a great deal of development in progress, I know
  we can get some of these completed this cycle:
** Active-active L3 Gateway with Multihoming (LP #2002687)
** Multiple back-end support for L3 routers in ML2/OVN (LP #2020823)
** Configurable Security Group rules added by default to new Security
   Groups (LP #1983053)
** ML2/OVN IPv6 Distributed routing (LP #1998609)

* Continue reducing the bug backlog. Over the past few cycles we were
  able to fix and/or close about 1/3 of our backlog (~400 bugs), but
  it will slowly creep back up if we let it.

We also have to continue looking forward by:

* Keeping the Neutron stadium ecosystem alive and healthy. There are a
  number of diverse projects, some without a large number of resources.
  We must make sure those communities receive whatever help they need,
  whether it's making sure we address bugs affecting them, or helping
  keep their CIs green.

* Address any SQLAlchemy 2.0 migration issues detected. We have done a
  great job during the last few releases with this work, let's keep that
  up in 2024.1.

* Starting development on newly proposed specs
** OVN interconnection (LP #2027742)

* Always welcoming new contributors.

Thanks for your support.

-Brian Haley (haleyb, haleyb.dev@gmail.com)
