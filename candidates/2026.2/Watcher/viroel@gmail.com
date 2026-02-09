Hi all,

I would like to announce my candidacy for Watcher PTL for the 2026.2
(Hibiscus) cycle.

I started contributing to OpenStack during the Stein cycle in Manila
project where I still assist with patch reviews, depending on the demand.
Starting at 2025.1 release, I have been a Watcher contributor and
maintainer, working with other contributors to revive the project and
tackle many of the existing technical debts. In 2025.2 I started the
effort to remove Eventlet from Watcher and in 2026.1, working as tact-sig,
have been refactoring our CI, including our stable branches, to properly
test patches in both check and gate pipelines.

For the 2026.2 cycle, these are some of the priorities that I plan to
focus on:

Testing and CI/CD Coverage Improvements:
* Support the implementation of new integration test in Watcher Dashboard
* Expand test coverage for features, datasources, and/or integrations that
  remain untested in CI (e.g.: Audit Scope feature)
* Start the effort on adding functional tests to Watcher
* Continue improvements to check/gate pipelines for master and stable branches

Scalability and Availability:
* Support for osprofiler in Watcher to enable performance analysis at scale
* Performance analysis in Action Plan parallelization

OpenStack SDK Migration:
* Support the migration effort started in 2026.1 to modernize the
  remaining integrations

Eventlet Removal:
* Make native threads the default thread mode in 2026.2
* Address performance gaps when running with native threading
* Prepare for Eventlet deprecation in 2027.1

Thank you for your consideration.

Douglas Viroel (dviroel)
