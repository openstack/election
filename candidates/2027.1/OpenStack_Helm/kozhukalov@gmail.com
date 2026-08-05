Hello OpenStack Community,

I am writing to submit my candidacy to be the PTL for the OpenStack-Helm project
for the 2027.1 cycle.

## Highlights from 2026.2

The cycle is not over yet, but the direction it took is already clear: we spent it
removing implicit, opinionated logic from the charts and giving operators explicit
extension points instead.

### Service exposure

- Added Gateway API support, including TLS, together with per-chart override examples.
- Removed the Ingress templates from all charts. How services are published depends far
  too much on the deployment, so this is now expressed as `extraObjects` overrides that
  the operator owns, rather than as chart logic.

### TLS

- API TLS is now terminated by nginx sidecars in front of uWSGI.
- Introduced mTLS for MariaDB and RabbitMQ using a shared client certificate, decoupled
  from the endpoint definitions.
- Outbound TLS trust is configured from a CA-only secret, which makes it easy to consume
  certificates issued by external tooling.

### Configuration

- Every service chart now supports a `<service>.conf.d` directory and `etcSources`, so
  users can add configuration snippets without patching chart values.
- Service accounts have been split out of the main config files, and `--config-dir` is
  wired through jobs and health probes.
- `extraObjects` and `extraContainers` are available in all charts, and we started moving
  optional components (libvirt, memcached, Open vSwitch and MariaDB exporters) out of the
  chart templates and into sidecars provided by the user.

### Declarative lifecycle management

- The spec for declarative MariaDB database management has merged, and the spec for
  moving chart dependencies to custom resources is in progress, with a working operator
  prototype behind it.
- The goal is a clear split of responsibilities: Helm packages and owns resources, while
  cross-service endpoints and anything depending on cluster state are resolved at runtime
  instead of at template rendering time. This also makes integration with the MariaDB and
  RabbitMQ operators much more natural.

### Images

- OpenStack service images are now built from flat, per-service Dockerfiles in
  openstack-helm-images, on top of a shared base and a venv builder image. This replaced
  the layered shell scripts and is far easier to read and to override.
- Continued the uv-based build workflow and ARM64 coverage.

### Charts and platform maintenance

- Moved to Helm 4, dropped the remaining Helm 2 support and pre-1.10 Kubernetes checks.
- Retired unmaintained charts and code paths: mongodb, flannel, shaker, the umbrella
  "openstack" chart, the linuxbridge ML2 driver and TungstenFabric support.
- Ubuntu Noble is the default base image; updated Ceph to Tentacle 20.2.1 with Rook
  1.19.x and ceph-csi 3.16.x, MariaDB 11.4.8, Grafana 12.
- OVN: added neutron-ovn-agent support, an ovn-bgp-agent daemonset and image, and
  chassis MAC mappings.
- Added optional StatefulSets for cinder-volume and manila-share, a CephFS backend for
  Manila.
- Security hardening: running placement-api as a non-privileged user, no longer leaking the Keystone
  bootstrap password in job logs, and protecting fernet and credential keys from
  accidental deletion.
- Improved health probes: oslo.healthcheck for readiness, uWSGI stats for liveness, and
  correct endpoint types in API probes.

### CI

- Refactored the test deployment scripts into Ansible playbooks.
- Tracked down several long-standing sources of flakiness in the gates, including
  admission webhook races and overlay MTU issues, which noticeably reduced rechecks.

## Focus for 2027.1

If elected, my priorities for 2027.1 are:

- Land the declarative (CRD) management for endpoints, dependencies and probably other entities
  discussed earlier. Keep the existing behaviour working for one release cycle so that nobody is forced
  to migrate in a hurry.
- Finish removing apache from the charts, and then make the WSGI server configurable.
- Start the chart modernization we agreed on at the PTG: new charts alongside the current
  ones (nova and ironic first) with a restructured values layout and subcharts, so that
  refactoring does not break existing deployments.
- Extend CI coverage so that more charts are exercised regularly, continue ARM64 work,
  and publish charts to an OCI registry.

I would like to sincerely thank all our contributors and users for their continued
support and for the discussions that shaped this plan. It would be an honor to serve as
PTL for the 2027.1 cycle.

Best regards,
Vladimir Kozhukalov
