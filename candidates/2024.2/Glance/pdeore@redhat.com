Hello Everyone,

I would like to announce my candidacy for Glance PTL for the
2024.2 cycle.

I have been the Glance PTL for the last 3 cycles.
Over the past couple of years we've had a small team looking
after Glance and planned the priorities accordingly. During Caracal
cycle we continued putting efforts in bridging the gap between
glanceclient and openstackclient and adding support of new location
APIs to mitigate the security issues.
We added support to use centralized database (default MySql) for
all caching related operations and stop using sqlite database
from this release onwards.

In 2024.2 cycle I would keep driving the key priorities,
finishing the work we've had in flight and focus on making glance
to configure multiple stores by default and add support for image
encryption and focus more on encouraging contributors for code reviews.

I'm thankful for all the support I've had from the team.

Thank you for taking my self nomination into consideration,

Pranali Deore (pdeore)
