Hi All,

I would like to nominate myself to be Cinder PTL during the 2024.1 (Caracal)
cycle.

I have been the Cinder PTL for the last 3 cycles namely Zed, 2023.1 (Antelope)
and 2023.2 (Bobcat). Few of the notable things we achieved in the past cycle
are:

* OpenStack Client and SDK work: We started two efforts in parallel:
** Migrate OSC commands to SDK[1]
** Add support of missing operations in SDK[2]

We are making good progress in this area but looking at the work items[3],
this effort will span across the next couple of cycles to be completed.

* Security Vulnerabilities: We were able to address a major security
vulnerability CVE-2023-2088 that prevents end users to delete volume
attachments directly leaving left over devices on compute hosts resulting
in data leaks.

* Transition from EM to Unmaintained: We noticed the inactive contribution
in extended maintenance branches and the need to fix gate issues from time
to time. Also the project team is responsible to merge changes into these
EM branches. After the recent CVE-2023-2088 wasn't proposed to EM branches,
it was clear that the efforts were not worth the outcome so the Cinder team
initiated a discussion regarding EOLing the current EM branches.
There is a resolution from TC to migrate EM to unmaintained branches[4].

* Outreachy Mentorship: We had a successful quarter of outreachy internship
from May-August 2023 with 2 interns, Desire and Toheeb. They were able to
get a good amount of work done on the project "Automating generation of
api-ref samples".

* Review bandwidth and quality: We have been able to maintain good quantity
and quality of reviews from contributors contributing from different
organizations.

Here are some work items we are planning for the next cycle (2024.1):

* We still lack review bandwidth since one of our active cores, Sofia,
couldn't contribute to Cinder anymore hence we will be looking out
for potential core reviewers.
* Continue working on migrating from cinderclient to OSC (and SDK) support.
* Continue with the current cinder events like festival of XS reviews,
midcycle, video meeting once a month etc that provides regular team
interaction and helps tracking and discussion of ongoing work throughout the
cycle.

[1] https://review.opendev.org/q/topic:cinderclient-sdk-migration
[2] https://review.opendev.org/q/topic:cinder-sdk-gap
[3] https://docs.google.com/spreadsheets/d/1yetPti2XImRnOXvvJH48yQogdKDzRWDl-NYbjTF67Gg/edit#gid=1463660729
[4] https://governance.openstack.org/tc/resolutions/20230724-unmaintained-branches.html

-
Rajat Dhasmana
