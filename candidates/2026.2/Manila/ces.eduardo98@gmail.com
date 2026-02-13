Hello,

I would like to announce my candidacy for Manila PTL for the 2026.2 (Hibiscus)
cycle.

I have been serving as Manila PTL for the past couple of releases and am
happily investing time and energy into working with this very talented and
passionate group of contributors.

Over these releases, we have been creating more and more opportunities for
contribution, ranging from code to involving cloud users and operators in our
discussions to collect feedback. This helps us deliver valuable enhancements
and fixes.

We still have lots to do, and that includes enhancing our contributor
experience. Therefore, in the upcoming cycle, I would like to direct our focus
to:

Eventlet: python-manilaclient is successfully migrated. We are now completing
the migration in the manila code base, so we will focus on finalizing it and
testing the changes we are making while moving away from eventlet.

Tech debt: Continue the efforts to reach parity between Manila APIs and Manila
UI, and complete the rootwrap -> privsep migration.

VirtioFS: Closing the scenario testing gap for VirtioFS.

Mentorship: Continue shepherding and encouraging more active reviewer
participation and preparing new core reviewers.

Communication: Reshaping the way we communicate and document our team
priorities.

Thank you for your consideration.

Carlos da Silva
IRC: carloss

[1] https://lists.openstack.org/archives/list/openstack-discuss@lists.openstack.org/thread/M3PUAYLNWMSRQDDWZRPCMMXBMVZU2BOD/