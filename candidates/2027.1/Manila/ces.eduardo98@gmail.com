Hello,

I would like to announce my candidacy for Manila PTL for the 2027.1 (Indri)
cycle.

I have been proudly serving as Manila PTL for the past couple of releases, and
thanks to this team's commitment and dedication, we have achieved a lot for our
users and operators. Together, we battled tech debt, implemented long wanted
features, made day-2 operations better and fixed many bugs, making this a very
stable project.

Together we fostered a true community spirit and promoted an open environment
for first-time and long-time contributors, we cultivated new core reviewers
focusing on affiliation diversity and background.

I would like to continue steering the ship on this direction, and for the
upcoming cycle, focus on:

Manila CLI migration to OSC: Continue and complete the migration of Manila
commands from python-manilaclient into python-openstackclient.

Eventlet removal stabilization: The manila code base migration away from
eventlet is underway. We will focus on stabilizing the changes, expanding
test coverage for the new concurrency model, and ensuring no regressions.

Growing future leaders: Continue mentoring contributors and cultivating new
core reviewers. I am committed to creating pathways for contributors to grow
into leadership roles within the team.

Communication: Reshaping the way we communicate and document our team
priorities.

Bug backlog: Reducing our open bugs backlog.

Thank you for your consideration.

Carlos da Silva
IRC: carloss