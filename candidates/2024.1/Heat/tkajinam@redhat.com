Hello,


I'd like to announce my candidacy for Heat PTL during 2024.1 cycle to continue
my PTL role for the next cycle.

Our team is small and have limited resources now. As the PTL I'd propose that
we focus on the following priorities.

* Keep CI green

This is always our top-priority to move our development as well as maintanence
forward.

* Adoption to sqlalchemy 2.0

This would be our biggest priority for the next cycle (and the subsequent
cycle) before the bump is made in upper-constraints.

* Adoption to SRBAC design update

The current implementation in Heat is based on old design which was updated
several times. We have to adapt to the new design to provide the consistent
experience with the OpenStack components.

Thank you for your consideration !

Thank you,
Takashi
