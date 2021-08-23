Greetings,

I would like to continue serving as Kuryr PTL for the Yoga cycle.
I have started serving as Kuryr PTL in the Wallaby cycle. It has
been a great opportunity to contribute back to the community as PTL
and I would like to continue doing that.

In the Xena cycle we achieved the following goals:
 * CI improvements: started moving gates to use OVN by default while
   still having a few supporting OVS.
 * Dev env improvements: Support for Kubeadm for DevStack installations.
 * Extended features in Kuryr: Support to reconcile Load Balancer with
   respective Kubernetes Service, improvement on the Kuryr logs.
 * Increased diversity of contributors with the great addition of
   contributors from the Outreachy program.

For the next cycle, I propose the following goals for Kuryr:
 * Improve CI: we already did great improvements,
   but we must continuously work on it to provide better and
   quicker feedback during the development process.
 * Add new features and improvements in Kuryr: Migrate CNI code from
   pyroute2.IPDB to NDB; Add support for reconciliation of other
   Kubernetes resources; Reduce OpenStack resource usage; Provide
   better debugging by relying on Kubernetes events.

Thank you,
Maysa de Macedo Souza
IRC: maysams
