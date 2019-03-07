Hi Everyone,

I would like to announce my candidacy for Quality Assurance PTL role for
Train cycle.

It was a great experience while serving QA PTL for the last two cycles.
As QA team, we are keeping our pace of providing and maintaining the tooling
for upstream stability. Though we have only few active resources in QA compare
to the previous cycle, but I really appreciate the people who are still doing the
QA contribution even in small extent. Upstream is not their first job in their
organization now, but they do review, feedback which is really helpful.

In Stein Cycle, we planned fewer items as compared to any previous cycle. Main
focus or theme in Stein was to improve the document, stability and best practice
for plugins, Stability of CLIs, Patrole Stable release.

Many of the items are still in progress, and the team is trying their best to
provide the more stable interfaces, and so does a stable gate. Another part we
did in Stein is to migrating the gate jobs to Bionic, zuulv3 jobs are done, and
legacy jobs are in progress.

Overall it was a good cycle for QA, where we kept our flag high for any help required
from any project side. But there are few things which I feel we should finish soon to
make QA life little easy,


- Stabilize the Tempest Plugins with correctly using stable interfaces. Few of such
improvements are already in progress. In addition, few of ideas are:
  - service_availabiilty option setting and its usage. [bug# 1743688]
  - stable interface from plugins for cross project testing
  - CI/CD setup for all plugins doing for stable branches also
  - improvement in installation and setup of plugins by adding the dependent plugin in requirement.txt

- Start RBAC testing via Patrole jobs on the project side gate.

- Update and centralize the QA release process responsibilities and other todo tasks
like distro migration etc. We do have release todo in wiki which we need to update as
a more streamlined way or if we can automate few of them.

- Encourage and mentor new contributors for QA contribution. This can be a good start
for new contributors. To learn about the projects. Starting from testing is always the
first best place to learn about any software.

All the momentum and activities rolling are motivating me to continue another term
as QA PTL to explore and showcase more challenges.

Thanks for reading and consideration my candidacy for Train cycle.

-gmann
