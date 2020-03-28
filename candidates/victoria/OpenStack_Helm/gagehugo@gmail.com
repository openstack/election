Hello everyone,

I would like to nominate myself to serve as the OpenStack-Helm PTL for the
Victoria cycle.

I have been a contributor to OpenStack-Helm for roughly 3 years now,
primarily focused on using the various charts to deploy and operate
an OpenStack environment on top of Kubernetes. I've also been involved with
the maintenance and development of a few of the charts, primarily the keystone
chart and the overall policy settings of the other charts.

One goal I would like to accomplish in this cycle is the adoption of
the Loci project underneath the OpenStack-Helm umbrella. OpenStack-Helm
utilizes Loci heavily for its image building and deploying, and with
the current downturn of activity in the Loci project, we could bring
the project in and provide the time and resources to keep it moving forward
into the future.

We need to continue maintaining our checks and gating as well. These have
been a pain-point in the past and we have had several excellent individuals
step up and help fix issues when needed. I would like to continue focusing
our work effort on them to make sure both our testing and gating is rock solid.

I believe together we can continue to do amazing work here.

- Gage
