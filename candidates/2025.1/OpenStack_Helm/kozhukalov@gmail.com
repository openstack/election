Dear OpenStack-Helm Community,

I am submitting my candidacy to continue as the PTL for the
OpenStack-Helm project for the 2025.1 release.

Here are some of the achievements during the 2024.2 cycle:

- Implemented a job for testing the migration from the OSH
  legacy Ceph charts to Rook (soon it will be improved even more).
- Introduced test jobs with two new CNI implementations: Flannel and Cilium.
- Enhanced user documentation to provide guidance on deploying
  OpenStack from public Helm repositories instead of OSH Git repositories.
- Updated TLS and umbrella jobs to run in a multi-node environment,
  aligning them with most other test jobs (except for the DPDK test job,
  which currently requires 32GB test nodes).
- Upgraded the Ubuntu version for some infrastructure images.
- Upgraded default versions for many components: K8s, Calico, Helm, Ceph, ES, Fluentd, etc.
- Finished migration to uWSGI for all major Openstack components.
- Fixed numerous minor issues and blockers.
- Successfully tested OSH with a Kubespray-managed Kubernetes cluster
  (the test job is in progress).

I would like to express my sincere gratitude to all the contributors,
including those who shared their experiences using OSH and provided
valuable suggestions for improvement in the project’s Slack chat.

It would be a honor to continue serving as PTL for OpenStack-Helm and
to keep driving its development forward.

Thank you for your consideration.

Thank you,
Vladimir Kozhukalov
kozhukalov@gmail.com
