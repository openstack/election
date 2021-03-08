Greetings,

I would like to continue serving as Kuryr PTL for the Xena cycle.

I have been contributing to the OpenStack community since the Queens
release and started serving as Kuryr PTL in the Wallaby cycle. It
was a great opportunity to contribute back to the community as PTL
and I would like to continue doing that.

In wallaby we achieved the following goals:

 * Improved CI stability and fixed broken gates e.g. Network Policy e2e
   and OVN gates.
 * Added new testing scenarios for Services without selectors
   and Services with sctp.
 * Extended Kuryr functionalities - we started the dual-stack support
   and included the support for SCTP and Service without selectors.
 * Increased the contributor base with new contributors from the
   Outreachy program.

For the next cycle, I propose the following goals for Kuryr:
 * Improve and extend CI: we already did great improvements,
   but we must continuously work on it to provide better and
   quicker feedback during the development process. As part of that,
   we plan to: update gates to start using Kubeadm and include a
   new cri-o gate.
 * Extend Kuryr functionalities: Support dual stack and Kubeadm
   for DevStack installations, and move Pools management to CRDs.
 * Continue growing the contributor base.

Thank you,
Maysa de Macedo Souza
IRC: maysams
