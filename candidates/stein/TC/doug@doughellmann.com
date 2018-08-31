I am announcing my candidacy for a position on the OpenStack
Technical Committee.

I started contributing to OpenStack in 2012, not long after joining
Dreamhost, and I am currently employed by Red Hat to work on OpenStack
with a focus on long-term project concerns. I have served on the
Technical Committee for the last five years, including as Chair during
the last term. I have also been PTL of the Oslo and Release Management
teams at different points in the past.

I have spent most of my time in all of those roles over the last few
years making incremental improvements in our ability to collaborate
while building OpenStack, including initiatives such as leading the
current community goal to run CI jobs under Python 3 by default [1];
coordinating last year's documentation migration; and updating our
dependency management system to make it easier for projects to run
stand-alone.

During my time serving as TC Chair, I have tried to update the way the
group works with the community. We started by performing a "health
check" for all of our project teams [2], as a way to spot potential
issues teams are experiencing that we can help with, and to encourage TC
members to learn more about teams they may not interact with on a
daily basis. We will be reviewing the results at the PTG [3], and
continuing to refine that process.

I have also had a few opportunities this year to share our governance
structure with other communities [4][5]. It's exciting to be able to
talk to them about how the ideals and principles that hold our
community together can also apply to their projects.

The OpenStack community continues to be the most welcoming group I
have interacted with in more than 25 years of contributing to open
source projects. I look forward to another opportunity to serve the
project through the Technical Committee over the coming year.

Thank you,
Doug

Review history: https://review.openstack.org/#/q/reviewer:2472,n,z
Commit history: https://review.openstack.org/#/q/owner:2472,n,z
Foundation Profile: http://www.openstack.org/community/members/profile/359
Freenode: dhellmann
Website: https://doughellmann.com

[1] https://governance.openstack.org/tc/goals/stein/python3-first.html
[2] https://wiki.openstack.org/wiki/OpenStack_health_tracker
[3] https://etherpad.openstack.org/p/tc-stein-ptg
[4] https://doughellmann.com/blog/2018/08/21/planting-acorns/
[5] https://www.python.org/dev/peps/pep-8002/
