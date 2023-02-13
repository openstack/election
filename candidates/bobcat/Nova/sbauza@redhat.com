Hey Nova and Placement folks,

Despite me saying that Antelope would have been my last cycle as PTL, I have to
fight the evidence : our project needs more contributors and we're struggled by
our current dynamics. That's why I'm hereby proposing to act as PTL for this
Bobcat release.

When looking at the mirror, we tried a couple of things te lower the entry
barrier in order to contribute to the Nova/Placement community :
- we had a productive meet-and-greet session at the Berlin summit
- we introduced a Review-Priority Gerrit label for identifying upstream interest
- people volunteered for upstream bug triage on a weekly basis
- we tried to minimize merge conflicts by ordering API changes

Those different efforts worked pretty well for helping the Nova project to get
more hands willing to solve problems, but it didn't helped that far the
reviewing dynamics. Yes, we not only need contributors that contribute but we
also need contributors that review what others contribute.
During this Bobcat cycle, I'll propose a couple of incentives in that direction.

This release is also special because it will be our first 'not-SLURP' [1] one.
As a PTL, I'll take an attention to track all the developments so we can
identify the necessary knobs in order to make this 'skipped' release a painless
experience for our operators.

Last but certainly not the least, the recent weeks showed us how fragile we are
when our Zuul gate gets cold. I'll continue to propose help, support and
visibility for our beloved firefighters that dig into those problems, including
the stable branches which are crucial for many consumers of those branches.


Anyway, nothing can happen magically, we need hands.
Thanks,
-Sylvain

[1] https://governance.openstack.org/tc/resolutions/20220210-release-cadence-adjustment.html