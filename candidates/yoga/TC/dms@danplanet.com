Hi,

I am declaring my candidacy for the Technical Committee.

I have been working on OpenStack since 2012, primarily as core
reviewer on and contributor to Nova and Glance, but also in various
other projects such as Oslo (oslo.versionedobjects, oslo.messaging),
Placement, Grenade, and devstack.

I have been on the TC for a year now, and have been focused on keeping
the TC aware and involved with day-to-day developer-facing issues,
such as gate performance. That has gone well and yielded improvement
in reducing spurious failures across multiple projects, as well as
paring down of duplicative testing and addressing other performance
issues. In the next cycle, we are coming up against the deprecation of
our logstash framework due to lack of support, which may be the next
big push we need to make to keep critical developer infrastructure
available.

--Dan
