Hello Everyone,

I would like to announce my candidacy for Glance PTL for the
2023.2 (Bobcat) cycle.

I served as the PTL for Glance during the Antelope development
cycle. Over the past couple of years we've had a small team looking
after Glance and planned the priorities accordingly. During Antelope
cycle we started putting efforts in bridging the gap between glanceclient
and openstackclient and enabling SRBAC new defaults by default.
We have added the support to extend attached volumes for cinder backend
and also addressed the new security issue which was reported in 2023.1
regarding VMDK file format for which a CVE has been filed, CVE-2022-47951.

In 2023.2 (Bobcat) cycle I would keep driving the key priorities,
finishing the work we've had in flight and focus on completing
on going effort on the security issue and making glance to configure
multiple stores by default.

I'm thankful for all the support I've had from the team, I feel it
was a good learning experience being PTL for the first time.
Hopefully I will take the learnings to be a better PTL this time.



Pranali Deore (pdeore)
