Hi,

I'd like to announce my candidacy, continuing as Winstackers PTL for the
upcoming Victoria cycle.

I've been working on OpenStack for quite some time now, focusing on Windows
integration. I'm really happy with what we managed to achieve so far, making
OpenStack a viable option for Windows deployments and vice versa, making
Hyper-V a good KVM alternative, especially for Windows workloads.

As with other OpenStack teams, stability has been the main focus over the past
few releases and I think we managed to take big steps in that direction,
especially when it comes to Microsoft Failover Cluster and S2D support.

We also kept in touch with the OpenStack community, conforming to project wide
goals (e.g. handling Python 3 deprecation in the early stages), fixing bugs and
picking up features in a timely manner.

It's no secret that we've been working on Ceph Windows support recently and
this will be the main theme for the upcoming cycle. This has been one of the
most demanded features.

Thank you for your consideration,

Lucian Petrut
