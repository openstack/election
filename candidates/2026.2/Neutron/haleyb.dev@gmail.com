Hello Openstack Community,

I am writing to submit my candidacy for the Neutron PTL position
during the 2026.2 cycle, continuing in my role that started in
the 2024.1 cycle.

My priorities as PTL are mostly the same as in previous cycles:

* Always make sure the stable branches are consumable downstream.
  With the introduction of unmaintained branches, the community has
  extended the lifecycle in a new direction. As a member of the
  downstream community that relies on these branches, I will continue
  to dedicate part of my time to reviewing backports and keeping them
  maintained.

* Continue to make sure Neutron stays ahead of governance timelines.

* Continue pursuing CI stability.

* Reduce the bug backlog. Over the past cycle we were able to keep
  our bug backlog constant through the continued great work of a lot
  of contributors. Having a reduction, either through verification
  or bug fixes, continues to be one of my goals.

* Introduce features for new use cases as they arise. There is a
  constant submissions of RFEs to the project, and making sure
  we address these use cases from, sometimes, new users of Openstack
  can only help us to grow the community.

* Making sure we are good stewards of gate resources.

* Always welcome new contributors.

* Increase ownership in neutron-* and networking-* sub-projects.
  I will make it a goal for this cycle to have more of the contributors
  in these projects be involved in bug triage, reviewing code submissions
  from others, as well as help with CI-related upkeep in the respective
  projects. Through this effort I hope to give more people merge rights
  to ease the burden on the neutron-core-reviewers team.

Thanks for your support.

-Brian Haley (haleyb, haleyb.dev@gmail.com)

