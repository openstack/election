Hello,


I'd like to announce my candidacy for Heat PTL during the Bobcat cycle.

I've been contributing to the project for several cycles and one of the core
reviewers in the project. My contribution has been focusing on keeping our CI
green so that we can merge new changes such as bug fixes or new features.

For this cycle I'd like to propose a few items as focus items.

* Keep CI green

This is our top priority. Keeping CI healthy is very important so that we can
operate the project properly.

* Adapt to changes in the other projects

Because heat relies on the other projects such as Nova to create resources,
it's important to adapt to the changes in underlying components (eg. API
microversions).

* Migration to OpenStack SDK

This is currentyl an important work so that some other projects such as
Neutron can complete migration from own client libraries. We already have
some patches proposed by Neutron cores (Thank you !) and reviewing and merging
these patches would be prioritized for the next cycle.

Thank you for your consideration !

Thank you,
Takashi
