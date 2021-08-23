Hi All,

I would like to announce my candidacy for Glance PTL for the
Yoga cycle.

I've had the great privilege of leading this team for
the past four releases. During this time we worked towards
improving and stabilizing image import workflow and the multiple
stores support features.

Over the past three/four years we've had a small team looking
after Glance and planned the priorities accordingly. During
Xean cycle we started putting efforts in refactoring policy
enforcement to move policy checks at API layer and remove the
current policy and authentication layer and implement secure RBAC
project scope for metadef APIs. 

In Yoga our priority will be to implement system scope and mark
secure RBAC feature as stable, remove policy and authentication layer
rom code base. Also we will keep focusing on improving tempest coverage
for glance.

Thank you for taking my self nomination into consideration,
Abhishek Kekane (abhishekk)
