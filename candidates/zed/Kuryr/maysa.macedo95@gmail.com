Hello OpenStack community,

I would like to announce my candidacy for the Zen cycle.
I have been serving as Kuryr PTL since the Wallaby and
I would like to continue doing that.

In the Yoga cycle we have achieved the following:

* Extended features and improvements: addition of events to
Kubernetes resources, reduction on the workload Kuryr puts
on Neutron, limiting the number of Neutron Ports creation
happening in parallel, continuation on the load-balancer
resources reconciliation with k8s Services, and many more.
* CI improvements: Made Devstack installations to use CRI-O
and improved some tempest tests.

For the next cycle, I propose the following goals to Kuryr:
* Continue improvements for Kuryr scalability with Neutron,
OpenStack resources reconciliation with Kubernetes and
Kuryr controller health checks.

Thanks for your consideration.

Best regards,
Maysa Macedo.

IRC: maysams
