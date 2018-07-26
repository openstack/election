Hi Everyone,

I would like to announce my candidacy to continue the Quality Assurance PTL
role for Stein cycle.

I have served as QA PTL in Rocky cycle and as first time being PTL role,
it was great experience for me. I have been doing my best effort in Rocky
and made sure that we continued serving the QA responsibility in better way
and Improving the many things in QA like new feature test coverage, docs,
Tracking Process etc.

In Rocky, QA team has successfully executed many of the targeted working items.
Few items and things went well are as below :-

* Zuul v3 migration and base job available for cross project use.
* Running volume v3 API as default in gate testing. Along with that running a
  single job for v2 API for compatibility checks.
* Tempest plugins release process to map with Tempest releases.
* Improving the test coverage and service clients.
* Releasing sub project like hacking and fix the version issues,  projects were
  facing on every hacking release.
* Completing compute microversion response schema gaps in Tempest.
* Finishing more and more work in Patrole to make it towards stable release
  like documentation, more coverage etc.
* We are able to continue serving in good term irrespective of resource shortage
  in QA.
* Supporting projects for testing and fixes  to continue their development.

Apart from above accomplishment, there are still a lot of improvements needed
(listed below) and I will try my best to execute the same in next Stein cycle.

* Tempest CLI unit test coverage and switching gate job to use all of them.
  This will help to avoid regression in CLI.
* Tempest scenario manage refactoring which is still in messy state and hard to
  debug.
* no progress on QA SIG which will help us to share/consume the QA tooling
  across communities.
* no progress on Destructive testing (Eris) projects.
* Plugins cleanup to improve the QA interface usage.
* Bug Triage, Our targets was to continue the New bugs count as low which
  did not went well in Rocky.

All the momentum and activities rolling are motivating me to continue another
term as QA PTL in order to explore and showcase more challenges. Along with
that let me summarize my goals and focus area for Stein cycle:

* Continue working on backlogs from above list and finish them based on priority.
* Help the Projects' developments with test writing/improvement and gate stability
* Plugin improvement and helping them on everything they need from QA.
  This area need more process and collaboration with plugins team.
* Try best to have progress on Eris project.
* Start QA SIG to help cross community collaboration.
* Bring on more contributor and core reviewers.

Thanks for reading and consideration my candidacy for Stein cycle.

-gmann
