Hi All,

I would like to announce my candidacy for Glance PTL for the
Xena cycle.

I've had the great privilege of leading this team for
the past three releases. During this time we worked towards
improving and stabilizing image import workflow and the multiple
stores support features. 

Over the past three/four years we've had a small team looking
after Glance and planned the priorities accordingly. During
Wallaby cycle we were able to add couple of important features
related edge computing like Distributed image import, new API
to show tasks associated with image, experimental support for
project persona in terms of secure RBAC and fixed some
important bugs.

In Xena our priority will be to continue the implementation of
remaining personas for secure RBAC and mark this feature as
stable. Also we will keep focusing on improving tempest coverage
for glance.

Thank you for taking my self nomination into consideration,
Abhishek Kekane (abhishekk)
