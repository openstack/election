Hello Everyone,

I would like to announce my candidacy for Glance PTL for the
upcoming 2025.1 cycle.

I have been the Glance PTL for the last 4 cycles.
Over the past couple of years we've had a small team looking
after Glance and planned the priorities accordingly. During Dalmatian
cycle we continued putting efforts in bridging the gap between
glanceclient and openstackclient and added support of new location
APIs to mitigate the security issues OSSN-0090 and OSSN-0065.
We have also addressed the new security issue which was reported in
2024.2 regarding arbitrary file access through QCOW2 external data file,
for which a CVE has been filed, CVE-2024-32498.

In 2025.1 cycle I would keep driving the key priorities,
finishing the work we've had in flight and focus on making glance
to configure multiple stores by default and add support for image
encryption and focus more on encouraging contributors for code reviews.

I'm thankful for all the support I've had from the team.

Thank you for taking my self nomination into consideration,

Pranali Deore (pdeore)
