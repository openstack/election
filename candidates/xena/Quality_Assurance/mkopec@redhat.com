Hi everyone,

I would like to nominate myself for the PTL role of the QA in the Xena cycle.

This would be my first PTL service, however, I have been contributing to
Tempest for several years and have been a core contributor for over a year now.
I'm also a core in refstack projects (python-tempestconf, refstack and
refstack-client).

A few things I would like to focus on in the Xena cycle:

 * Get Tempest scenario manager effort [2] finished - we started actively
   working on this ~2 cycles ago and we have made a significant progress.
   After it's done we will declare the interface stable which will help to
   decrease the code duplicity among tempest plugins which is directly related
   to the maintenance difficulty.

 * Keep decreasing the bug counts

 * Decrease the number of open patches. Although many projects suffer from not
   enough personal resources, we can't let the contributors go out of their
   steam by making their patches to wait in the queue for too long.

 * Complete priority items from the previous cycles


[1] https://www.stackalytics.com/?user_id=mkopec
[2] https://etherpad.opendev.org/p/tempest-scenario-manager

Thanks for your consideration!
-- Martin Kopec (kopecmartin)
