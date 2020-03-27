Hello,

I'm writing this to announce my candidacy for Kuryr Project Team Lead in the
Victoria cycle.

I was the PTL of Kuryr project for 1.5 cycle now and I'd like to continue
serving in this role.

In the Ussuri cycle we succesfully implemented a few goals:
* kuryr-controller is way more stable now.
* We've addressed and are addressing technical debt (e.g. CRDs usage
  improvements).

I see following goals for the Kuryr project during the Victoria timeframe:
* Keep working on improving testing.
* Decide what to do with kuryr-lib in event of Zun project getting more
  traction recently.
* Continue working on extending kuryr-kubernetes support for technologies and
  functionalities - IPv6, DPDK, SR-IOV, monitoring, upgradability.

Thanks,
Michał Dulko (dulek)
