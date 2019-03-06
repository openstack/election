Hi Kuryrs,

I'm writing this in order to announce my candidacy for Kuryr PTL during the
Train cycle, althought I expect no Train horns this time at Denver!

It has been my pleaseure and nonor to act as PTL for Kuryr the past two cycles
and I'd like like to run for this for another release. I'd like to thank you all
on helping me deliver and run this project during all this time I think we have
been doing an awesome job so far within the OpenStack community.

During Stein, we had an great cycle, delivering most of the goals we set for it,
and movign forward, these are some of the goals that I propose for the team
during the Train cycle:

* Network Policies: Although this is a feature we landed in last cycle, I'd like
  for it to be enhanced so it gets faster, so optimizing its performance would
  be one of the cycle goals.

* Neutron pooling resource speedupts: Tied to the last topic, it'll still need
  to further improve the resource handling speed.

* Release model: So far we've been catching up with two release models,
  OpenStack and Kubernetes, as this is quite an effort and could lead to an
  endless testing matrix, one of the goals that I'd like to settle in the cycle
  would be on how to deal with such circumstances.

* SRIOV/DPDK upstream gate testing.

* Further improve debugging and instrospection tools usign Kubernetes plugins.

* Expand the Kuryr community by adding more contributors.

Also, I'd like to coordinate integrating some features that we started last
cycle, such as Native OVN Layer Load balancing and Multi device/net support.

Outside of this key areas, my priority is also helping the community by acting
as an interface for the cross-project sessions and further improve our presence
in initiatives such as Openlab, OPNFV and Edge. Besides that, I've also sent an
email with etherpad links for PTG planning[1] and forum sessions[2] at the
 Summit.

[1] https://etherpad.openstack.org/p/kuryr-denver-train-ptg-planning
[2] https://etherpad.openstack.org/p/DEN-train-forum-kuryr-brainstorming

Thanks a lot!

Daniel Mellado (dmellado)
