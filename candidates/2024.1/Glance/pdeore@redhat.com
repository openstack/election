Hello Everyone,

I would like to announce my candidacy for Glance PTL for the
2024.1 (Caracal) cycle.

I have been the Glance PTL for the last 2 cycles.
Over the past couple of years we've had a small team looking
after Glance and planned the priorities accordingly. During Bobcat
cycle we continued putting efforts in bridging the gap between
glanceclient and openstackclient and adding support of new location
APIs to mitigate the security issues.
We have added the support to configure weight for each store to
get rid of the problem with existing location strategy while
downloading the image from specific store when multiple stores
of same type are avialble.

In 2024.1 (Caracal) cycle I would keep driving the key priorities,
finishing the work we've had in flight and focus on making glance
to configure multiple stores by default.

I'm thankful for all the support I've had from the team.

Thank you for taking my self nomination into consideration,

Pranali Deore (pdeore)
