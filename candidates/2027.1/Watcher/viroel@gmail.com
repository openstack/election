Hi all,

I would like to announce my candidacy for Watcher PTL for the 2027.1 cycle.

I started contributing to OpenStack during the Stein cycle and have been a Watcher
contributor and maintainer since 2025, working with other contributors to revive the
project and tackle many of the existing technical debts. I served as Watcher PTL for
the 2026.2 (Hibiscus) cycle and would like to continue leading the project.

For the 2027.1 cycle, the Watcher priorities are similar to the previous cycle and
we plan to focus on:

Testing and CI/CD Coverage Improvements:
* In 2026.2 we added Playwright-based automated testing support in Watcher Dashboard
  and established an initial framework for functional tests in Watcher repo. In 2027.1,
  we plan to continue adding more automated tests for the Dashboard and expand the
  functional test framework with new test cases.
* Continue adding automated tests for strategies and features that still lack coverage,
  and fix bugs uncovered during test implementation.

Scalability and Availability:
* In 2026.2 we landed several bug fixes that significantly improved performance for
  multiple Watcher strategies. We plan to continue improving the Planner and Action
  Plan execution parallelization with additional bug fixes and potentially new features.

OpenStack SDK Migration:
* In 2026.2 we migrated the Keystone, Cinder and Placement integrations to use
  OpenStackSDK. In 2027.1 we plan to include the Ironic integration, completing the
  remaining integrations.

Eventlet Removal:
* In 2026.2, native threading became the default mode and Eventlet was deprecated.
  We plan to remove the remaining Eventlet code early in the 2027.1 cycle, completing
  the full transition.

New Features and Deprecations:
* Work towards new Watcher features, which may include an enhanced Decision Engine
  Planner framework and a smarter strategy filter mechanism that enables strategies
  to make finer-grained decisions about instance migrations within their solution.
* Continue to identify features and integrations that lack adequate tests and
  documentation, and when interest is absent from contributors to maintain them,
  propose deprecations and future removals.

Thank you for your consideration.

Douglas Viroel (dviroel)
