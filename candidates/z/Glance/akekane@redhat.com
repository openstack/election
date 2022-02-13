Hi All,

I would like to announce my candidacy for Glance PTL for the
Z cycle.

I've had the great privilege of leading this team for
the past four releases. During this time we focused on some
major refactoring including moving policy checks towards API
layer to make SRBAC implementation easy enough. Introduced
limits based quota system, distributed image import workflow
etc.

Over the past three/four years we've had a small team looking
after Glance and planned the priorities accordingly. During
Yoga cycle we started putting efforts in adding new caching
APIs to help ease the caching operations, added quota-usage API
to help user to understand the quota statistics and revisit
out bug backlogs.

In Z our priority will be to complete SRBAC work, remove policy
and authentication layer from code base. Also we will keep focusing
on improving tempest coverage for glance.

Thank you for taking my self nomination into consideration,
Abhishek Kekane (abhishekk)
