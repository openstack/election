Hello OpenStack-Helm Community,

I am submitting my candidacy to continue as the PTL for the OpenStack-Helm project
for the 2025.2 release cycle.

## Achievements in 2025.1
Over the past cycle, we have made significant progress in several areas:

### Improved Chart Versioning and Release Notes Management
We have enhanced the way chart versions and release notes are handled. Now, all charts
are aligned with the OpenStack release cycle. The tarball version and metadata are
dynamically calculated based on Git commit and tag history. Additionally, all tarballs
are published with an automatically generated CHANGELOG.md, sourced from the project's
release notes.

### Enhanced Loci Image Testing and Publishing
Loci images are now tested with OSH charts before being published to docker.io/loci and
quay.io/airshipit, giving users the flexibility to choose their preferred registry.
We have also migrated our test jobs to use quay.io. Meanwhile, the OpenStack-Helm-images
repository is now designated solely for maintaining infrastructure-related (non-OpenStack)
images. As a result, all OpenStack images currently published under docker.io/openstackhelm
will no longer be updated after 2025.2.

### Integration with Externally Managed Kubernetes Secrets
We have reached a consensus on how to consume credentials from externally managed
Kubernetes Secrets. This approach allows Helm to remain responsible for deployment and
configuration while third-party tools manage sensitive information. Although this feature
has not yet been implemented, it lays the foundation for a more secure and flexible
credential management strategy.

### Improved OVN Lifecycle Management
The OVN chart now utilizes lifecycle management scripts from the OVN Kubernetes project,
improving the way OVN components are managed.

### Ongoing Chart Improvements and Bug Fixes
Numerous fixes and improvements have been merged across various charts, including MariaDB,
Memcached, Ironic, Cinder, Glance, and more.

Looking Ahead
I want to extend my sincere gratitude to all the contributors who have helped
drive the OpenStack-Helm project forward.

It would be an honor to continue serving as PTL, and I am eager to keep pushing the
project's development in the right direction.

Best regards,
Vladimir Kozhukalov
