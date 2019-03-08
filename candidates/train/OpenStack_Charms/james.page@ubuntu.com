Hi All

After taking a (PTL) break for the Stein cycle I'd like to announce
my candidacy for PTL of the OpenStack Charms project for the
Train cycle.

Under Frode's leadership the project has made some great steps
forward during the Stein cycle; specifically we've made good progress
on Python 3 adoption with the majority of charms now using
Py3 for charm execution, and a large number of the OpenStack
projects we deploy running under Python 3 as of the Rocky release.

This is important work bearing in mind the limited amount of Py2
lifetime left and something I want to ensure we complete during
the upcoming cycle.  We might still have a few bumps to get
through but I think we know the gaps and it should be achievable.

We have also made some great progress on removing our dependence
on legacy charm tooling such as Amulet; Zaza is a great step
forward providing us with a much cleaner codebase for sharing
and executing tests across the charms.  Again we need to tick
off the last few stragglers and get our charm gating up to spec
across the board in the upcoming cycle.

A number of charm users have been attempting to deploy the
OpenStack Charms using some of the new Juju cross-model relation
features.  This is a somewhat bumpy experience right now with
various issues which block full use - I'd like to focus on
identifying the common use cases for using multiple models
and ensure we have test coverage for these use cases
in our regular charm testing so we can resolve any immediate
issues and make sure we don't cause regressions going forward.

As always I'm sure there will be new and interesting features
to expose across the OpenStack Charms and I look forward to
helping steer the project for the next 6 months!

Cheers

James
