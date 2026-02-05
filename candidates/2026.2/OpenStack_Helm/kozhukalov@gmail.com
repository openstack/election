Hello OpenStack Community,

I am writing to submit my candidacy to be the PTL for the OpenStack-Helm project
for the 2026.2 cycle.

## Highlights from 2026.1
During the 2026.1 cycle we focused on improving reliability and operability,
while modernizing our ingress and image pipelines.

### OpenStack-Helm
- Ingress: added HAProxy Ingress support and switched the default ingress
  controller to HAProxy (while keeping ingress-nginx support for existing
  deployments). Ingress-nginx is planned to become unmaintained after February
  2026.
- Images: moved infra images to Quay.io (`quay.io/airshipit`) and
  cleaned up outdated overrides. Use Loci Skyline images instead of vendor specific.
- Charts: merged the Trove chart and continued expanding supported
  services. Swift chart work is in progress (currently under review).
- Maintenance: updated Ceph (Tentacle) and Rook versions used by default,
  retired unused charts (e.g., Monasca), and removed the umbrella "openstack"
  chart.
- Hardening/cleanup: removed remaining `policy.json` usage and reduced host-level
  privileges in the Ironic chart (dropping host mounts/hostIPC).
- Updated the Helm repository structure and the helm tarball build pipeline.
  Now we re-build and publish only updated charts to per chart directories.
- Improved UWSGI default configuration to avoid fault liveness check failures and
  pod restarts.

### LOCI (service images)
- Added an alternative UV-based image build workflow (two-stage venv build)
  while keeping the existing pip/requirements-image flow for compatibility.
- Added ARM64 build support (including CI nodesets) and continued expanding
  image coverage for additional services (e.g., Trove and Swift).

### OpenStack-Helm-Images (infra images)
- Continued updating the infra image toolchain, including switching CI/build
  jobs to common `*-container-image` roles and adding Ubuntu Noble-based images
  (e.g., MariaDB 11.4.8).
- Started enabling multi-arch/ARM64 builds for infra images to better
  support ARM-based deployments.

## Focus for 2026.2
If elected, my priorities for 2026.2 are:

- Add Gateway API support.
- Keep expanding ARM64 coverage (images + CI + deployment guidance).
- Maintain CI stability and add more deployment test cases so more charts are
  exercised regularly.

I would like to sincerely thank all our contributors and users for their
continued support. It would be an honor to serve as PTL for the 2026.2 cycle.

Best regards,
Vladimir Kozhukalov
