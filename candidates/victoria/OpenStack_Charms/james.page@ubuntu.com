Hi All

After taking a (PTL) break for the Ussuri cycle I'd like to
announce my candidacy for PTL of the OpenStack Charms project
for the Victoria cycle.

The Ussuri Cycle has co-incided with a number of underlying
technology changes in main OS distribution that the OpenStack
Charms target (Ubuntu), and we've made great progress during
the cycle to support MySQL 8 InnoDB Clustering and OVN as
new deployment choices for the upcoming release including
having automated migration paths from previous technology
selections in these areas.

The Victoria cycle will have less material changes for the
OpenStack Charms project so is a great opportunity to burn
down on the technical debt TODOs across the project to
further stabilise and mature the project codebase.

As always I'm sure there will be new and interesting features
to expose across the OpenStack Charms and I look forward to
helping steer the project for the next 6 months!

Cheers

James
