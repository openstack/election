Hi,

I would like to announce my candidacy for Octavia PTL for the Bobcat release.
I have been PTL since the Xena cycle and I want to continue to contribute to
this role.

For the Bobcat release I would like to focus on important internal tasks, such
as completing the SQLAlchemy 2 migration and moving from python-neutronclient
to openstacksdk. I would like also to improve the amphorav2 driver by analyzing
and optimizing the SQL queries (we know we're doing many DB calls).

Thanks for your consideration,

Gregory Thiemonge (gthiemonge)
