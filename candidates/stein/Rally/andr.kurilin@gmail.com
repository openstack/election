Hi, everyone!

We finally finished refactoring of the critical parts which made it possible to
move OpenStack plugins to the separate repository and simplify the framework
part itself. It is really great news, but we need to move forward.

As for the Stein cycle, my roadmap for Rally project is:

* concentrate on docs. Long time ago, we started writting a great
  documentation. Unfortunately, it was not finished, some pages became
  outdated and a lot of features & use-cases were not documented.
  We should fix this issue;

* expand the base of Rally plugins and supported platforms;

* fix some UX issues (logging, CLI, etc);

* update html reports;

* simplify configuration of environment specific things.
