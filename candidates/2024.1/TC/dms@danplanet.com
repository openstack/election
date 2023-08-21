I am declaring my candidacy for the Technical Committee.

I have been working on OpenStack since 2012, primarily as core
reviewer on and contributor to Nova and Glance, but also in various
other projects such as Oslo (oslo.versionedobjects, oslo.messaging),
Placement, Grenade, and devstack. I have also been a strong advocate for
keeping the gate working well, for fixing problems instead of rechecking them,
and for optimizing our testing infrastructure to keep it healthy for
everyone to use.

I have been on the TC for a few years now, and have been focused on
keeping the TC aware and involved with day-to-day developer-facing
issues, such as gate performance. That has gone well and yielded
improvement in reducing spurious failures across multiple projects, as
well as paring down of duplicative testing and addressing other
performance issues. I also championed the effort to define a modified
slow/fast release cycle to address operational concerns about release
frequency. We are headed into the cycle where our first SLURP-to-SLURP
upgrade promise will be tested and I plan to continue to focus on making
sure that works, is tested, and is documented for operators.
