Hello Openstack Community,

I write to submit my candidacy for the Neutron PTL position during the
Yoga cycle.

I have worked with Openstack since Grizzly in downstream projects,
and as a fulltime upstream developer from Rocky. I mostly focused on Neutron,
but worked with testing, CI and even added some networking features to Horizon.

I work for Ericsson, who brings in interesting TelCo needs and experiences, like
trunks or bandwidth aware scheduling. In Ericsson I worked not only as
developer, but as team lead and team coach, that gave me opportunity to view
things from different perspectives and help teams to solve issues together.

I tried to keep Neutron stadium projects alive and maintained, actively
participated in Neutron meetings and in activities like the scheduled bug
deputy weeks.

In the last cycles the Neutron community was stable, and worked together as a
real team, and was the best experience of my professional life to work with them
and learn every day new things. As I see the team was able to create a kind of
gravitation that encouraged developers from around the world to report their
bugs, propose their fixes and new ideas to networking projects.

My priorities as PTL are the following:

* Keep Neutron's stadium ecosystem alive and healthy. In Xena we moved
tap-as-a-service back to stadium, and there's even new features arriving
to make some of them work with OVN. Continue this effort to keep Neutron
as a natural API and code base for many projects.

* The team has strong tradition to focus on CI with dedicated weekly meeting,
eyes on jobs' results and increasing test coverage. Continue these efforts to
make Neutron CI more stable and capable of giving fast and reliable feedback
to developers.

* In the last cycles OVN became one of Neutron's in-tree backends, and now it is
used as default backend in Openstack CI. There's a continuous effort to remove the
gaps between ML2/OVS and OVN
(see: https://docs.openstack.org/neutron/latest/ovn/gaps.html), some of these
already have owner (like QoS Minimum Bandwidth allocation with Placement, or
BGP), this effort should be continued.

* Neutron team is quite healthy, but I want to onboard developers from other
companies to keep the influx of people and ideas.

* In the last cycles the performance improvements were always on the written or
unconscious TODO list of the team (like enginefacade-switch, or this cycle's
efforts from Oleg and other Huawei developers). Like CI, performance
improvements and monitoring should be a continuous effort.

* Continue the ongoing implementation for feautres like new QoS rules (pps
limit and minimum pps), and new l3 related features.

Thank you for your time and consideration.

Lajos Katona (lajoskatona)

