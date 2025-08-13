Hello OpenStack Community,

I am writing to submit my candidacy to be the PTL for the OpenStack-Helm project
for the 2026.1 cycle.

## Achievements in 2025.2
Although the release cycle is not yet complete, we can already highlight some points

### Loci
- Cleaned up outdated customizations
- Cleaned up Centos related files
- Added images Blazar, Freazer
- Mount requirements image instead of fetching wheels via HTTP
- Use Opendev Infra APT mirror

### Openstack-Helm-Infra retirement
It's been a while since we started episodically discussing the merger of
Openstack-Helm and Openstack-Helm-Infra repos and eventually decided to implement
this to make it easier to implement/test things involving infra charts.

### New charts
- Skyline (merged)
- Watcher (merged)
- Blazar (on review)
- Freazer (on review)

### Tests
- Implemented VXLAN overlay networking in test environments to address issues
  when test nodes are in different L2 segments. This has improved stability and reduced rechecks.
- Use pre-commit for linting. The pre-commit framework supports many languages and provides
  various checks that can be easily run on a local developer machine.
- Added an **Octavia** test case. Currently, it tests only the Amphora driver;
  OVN driver tests are planned for a future update.

### Ingress
We are on the way of improving the Ingress object management. At this point we've
changed all the test jobs to use Metallb as a frontend for the Ingress controller
eliminating the need for a so-called `cluster ingress`. By the end of 2025.2,
we aim to simplify Ingress management across all charts.

### Granular service accounts
- For core services (**Nova**, **Placement**, **Neutron**, **Glance**, **Cinder**),
  we introduced dedicated service accounts for inter-service access (e.g., `nova_neutron`,
  `nova_placement`). This approach improves security and flexibility.
- Service account configurations have been split into dedicated files (e.g., Nova’s
  service accounts are now defined in `/etc/nova/nova.conf.d`), which are automatically
  included by `oslo.config`.

I would like to sincerely thank all our contributors and users for their continued support.
I look forward to further fruitful collaboration.

It would be an honor to continue serving as PTL, and I am eager to keep pushing the further
project's growth and innovation.

Best regards,
Vladimir Kozhukalov
