Dear all,

I'd like to announce my candidacy for Kuryr's PTL for the Stein cycle.

In case you don't know me, I was fortunate to work as PTL on Kuryr and its
related projects for the Rocky cycle where I'm happy to sat that we've achieved
most of the milestones we set. I would be honoured to continue doing this for
the next six months.

During Stein, I would like to focus on some of these topics. We've also started
efforts on Rocky which I'd like to lead to completion.

* Network Policy Support: This feature maps K8s network policies into Neutron
  segurity groups and it's something I'd personally like to lead to completion.

* Neutron pooling resource speedups: Tied closesly with the previous feature,
  it'll be needed as a way to further improve the speed Neutron handles its
  resources.

* Operator Support

* Octavia providers:

  Native OVN Layer 4 load balancing for services
  Amphora provider for Routes

* Native router supports via Octavia

* Multi device/net support

Also, I'd like to coordinate finishing some features that might not be making it
for the Rocky cycle, such as SRIOV and DPDK support, and adopt the usage of CRDs
within the project.

Outside of this key areas, my priority is also helping the community by acting
as an interface for the cross-project sessions and further improve our presence
in initiatives such as Openlab, OPNFV and so.

Thanks a lot!

Daniel Mellado (dmellado)
