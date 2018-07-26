Hello everybody,

I would like to submit my candidacy as CloudKitty's PTL for the Stein cycle.

I have been contributing to CloudKitty since the Newton cycle and I am a core
reviewer since the Queens cycle. I work on CloudKitty full-time (upstream
development, reviewing, and CloudKitty deployments for customers).

If I was CloudKitty's PTL, these would be my priorities (starting with the most
important one):

* Help CloudKitty's community to grow. This is a crucial point to me. If we want
  the project to become the standard for cloud rating, we need some more
  contributors, user feedback, feature requests...

* Improve the documentation. Some work is currently being done on it, but we
  definitely need more. I believe that a developer documentation would help us
  to gain new reviewers.

* Add some crucial features: considering CloudKitty's recent evolutions, some
  features are needed: A new API, a new metric-oriented storage backend (there
  is currently some work done on that), and a new rating module allowing audit
  (How was my data rated ? Which rating rule was applied on it ?)

I will use this opportunity to give thanks to all the people who have been
involved in CloudKitty: developers, reviewers, users... The project lives
thanks to you!

Thank you for your attention,

Luka Peschke
