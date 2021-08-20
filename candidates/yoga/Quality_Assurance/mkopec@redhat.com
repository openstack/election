Hi everyone,

I would like to propose my candidacy and continue serving as Quality Assurance
PTL in the Yoga cycle.

I would like to thank all the contributors, core reviewers, and anyone
involved, all this wouldn't be possible without you.

In the Xena cycle we have finished Tempest scenario manager effort [2] which
had been ongoing for a few cycles. We have declared the interface stable which
helps decreasing the code duplicity among tempest plugins.

We have also finished a good number of priority items carrying for several
cycles. Involvment in an open source contest [3] held by Red Hat really helped
here as we had got a chance to cooperate with students passionate about
open source.

My priorities in the Yoga cycle will be:

 * Guiding and motivating more contributors to QA projects.

 * Start removing any duplicated code from tempest plugins as a result of
   declaring tempest's plugin interface stable in the Xena cycle.

 * Keep decreasing the bug counts and watching over open reviews as these are
   cruical activities to keep us moving forward.

 * Complete priority items from the previous cycles.


[1] https://www.stackalytics.com/?user_id=mkopec
[2] https://etherpad.opendev.org/p/tempest-scenario-manager
[3] https://etherpad.opendev.org/p/openstack-open-source-contest-2021

Thanks for your consideration!
-- Martin Kopec (kopecmartin)
