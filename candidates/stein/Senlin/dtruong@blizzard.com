Hello everyone,

I'd like to announce my candidacy for the Senlin PTL position during the Stein
cycle.

I've been contributing to Senlin since the Queens cycle and became a core
reviewer during the Rocky cycle.  I work for Blizzard Entertainment where I'm
an active operator and upstream developer for Senlin.  I believe this dual role
gives me a unique perspective on the use cases for Senlin.

If elected as PTL, I will focus on the following priorities:

* Testing:
More integration tests are needed to avoid any regression due to new feature
implementations.  More rally tests are needed to cover stress testing
scenarios in HA deployments of Senlin.

* Bug fixes:
Actively monitor incoming bug reports and triage them.  Clean out old bugs
that can no longer be reproduced.

* Technical debt:
Identify areas of code that can be reimplemented more efficiently and/or
simplified.

* User documentation:
Restructure the Senlin documentation to make it easier for the users to find
the relevant information.

* Grow the Senlin community:
My goal is to grow the Senlin user base and encourage more developers to
contribute. To do so, I propose changing the weekly meetings to office hours
and hold those office hours consistently so that new users and/or developers
can ask questions and receive feedback. Moreover, I want to increase Senlin's
visibility in the developer community by more actively using the mailing list.
One idea would be to send out Senlin project updates to the mailing list
throughout the cycle like many other projects are doing now.

Thanks for your consideration.

Duc Truong (dtruong)
