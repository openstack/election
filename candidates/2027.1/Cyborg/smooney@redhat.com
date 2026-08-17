Hi all,

I am announcing my candidacy for the Cyborg PTL role for the 2027.1 cycle.

Background and First-Term Progress:

I have been an OpenStack contributor for over a decade, with deep experience
in accelerator management, PCI passthrough, and compute service integration.
During 2026.2, I had the privilege of serving my first term as Cyborg PTL.

When I took on the role, Cyborg had been dormant for several cycles. During
my first term, we restored regular meetings, bug triage, backlog review, and
active release and branch maintenance. We also stabilized the gate and
expanded test coverage. Cyborg has returned to active maintenance, though
broad community engagement remains limited. Broadening participation and
shared ownership remains a key goal for 2027.1.

A major part of this work has been making real device lifecycles testable
without specialized hardware. As a team, we developed and refined the pci-sim
kernel module to emulate SR-IOV PCI devices in first-party CI. Both the mdev
integration, including CI coverage, and the generic NVMe support were proposed
during 2026.2. We expect the NVMe work to land before feature freeze, while
contributor availability means that mdev review and integration may carry into
early 2027.1.

Priorities for 2027.1:

Device Management and Driver Architecture:

We will complete the review and integration of any PCI, NVMe, and mdev work
carried over from 2026.2 and reconcile the overlapping pci-sim changes. We will
then harden all three as documented, repeatable workflows covered by
first-party CI using pci-sim and other software fixtures.

In parallel, we will introduce a shared PciBusManager modeled on the
MdevBusManager in the new generic mdev driver. Applicable drivers will be
adapted to reuse common bus-level discovery and lifecycle management. We will
also replace loosely structured dictionary- and tuple-based interfaces with
explicit typed data models and strongly typed interfaces. This will reduce
duplication while keeping vendor-specific behavior in focused extensions.

Project Health and Documentation:

We will continue improving gate reliability and build on the API sample tests
started in 2026.2 to expand functional coverage. Stable branch and upgrade
testing, regular releases, dependency updates, bug triage, and backlog review
will remain part of the project's normal cadence.

We will also invest in restructuring Cyborg's documentation so that operators,
users, and contributors can more easily find accurate guidance. This work is
being tracked at:
https://etherpad.opendev.org/p/openstack-cyborg-documentation

Governance and Community:

Alongside regular meetings, PTG planning, and cross-project coordination, I
intend to refresh core team membership to reflect active participation and
current responsibilities, while mentoring contributors toward core roles. The
exact model is not yet settled, but I want to evaluate an Ironic-style tiered
structure separating +2 review rights from Workflow +1 approval rights. I will
also work to distribute release, liaison, triage, testing, review, and approval
duties so that I am no longer a single point of failure.

API and Nova Integration Research:

We will adopt openstacksdk as the supported client layer for Nova-to-Cyborg
communication and refine Cyborg's API design around device lifecycle
operations. We will revisit device and resource modeling in Placement and
research the interactions needed for cold and live migration of instances
with accelerators. Where useful, we will develop proofs of concept to validate
these designs, without promising production completion during 2027.1.

My goal is to make Cyborg both useful to operators and sustainable for the
contributors who maintain it.

Thank you for considering my candidacy.

Sean Mooney (sean-k-mooney)
