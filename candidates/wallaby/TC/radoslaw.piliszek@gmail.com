Hello, Folks!

This is yoctozepto speaking. I am here to propose my candidacy for the
Technical Committee.

If you don't know me, then I guess I should first invite you to read my
previous (and effectively first) TC candidacy proposal. [1]
TLDR; my background is public academia and turning metal into clouds [2],
i.e. I am mostly technical but can drive high-level design as well.

One could say I am now one cycle smarter and that would be true.
Continuing my work in Kolla and QA (mostly DevStack) projects, I gained
an abundance of new insight in how things work and do not work.
I recently picked up the roles of core and multi-liaison of the Masakari
project to let it release in Victoria smoothly.

As I came to understand the vast containerisation did not get a very
welcome reception (which I am sad about as you know my stance on that),
I decided not to pursue that exact model for the time being.
OpenStack projects, not being quite cloud-native, do not have the best
gain/effort values.
However, this does not mean I gave up on the idea completely.
As a matter of fact, I pursued the work started by Mark Goddard (mgoddard)
to let other projects co-gate with Kolla (which, de facto, provides the
most popular OpenStack-containing images at the moment).
The first target of that approach is Bifrost which now runs a, still
non-voting but fingers crossed for gating, Kolla job which actually
lets Bifrost detect whether they are not intermingling the build and
run steps. And that is something I consider a win in the long term.
Other projects are welcome to join the Kolla testing party.

The above aligns with my general strategy to keep things well-tested and
their CIs robust. To this end, I help projects get out of the RED gate
misery. I also take pride in reducing greatly the number of internal
Kolla issues (e.g. playbook race issues and similar) in the last few
cycles. Recently, we observed mostly external ones (py2drop+setuptools+pip
multidrama).

As a TC member I want to be an advocate of cross-project efforts and
help with cross-project mediation, especially in the field of testing.
A goal of mine to pursue is working towards better communication
tools, focusing on lowering the barrier and modernising OpenStack
ecosystem in this regard, mostly basing on Project Pylon [3] proposed
by Jean-Philippe Evrard (evrardjp) in the ideas repo, especially the
IRC part (following projects like Mozilla but also smaller ones, like
LimeSurvey). While I spent my childhood on IRC (not all of it), I
understand the issues people are having with it, considering the
availability of more modern technology.

Finally, my general focus is on making OpenStack easily consumable by
smaller institutions to make it popular in this segment. Better
communication tools, with lower entry barrier, are part of this focus.

[1] https://opendev.org/openstack/election/src/branch/master/candidates/victoria/TC/radoslaw.piliszek@gmail.com
[2] https://en.wikipedia.org/wiki/Sublimation_(phase_transition)
[3] https://review.opendev.org/718932

Thank you for your time and trust,

- Radosław Piliszek (yoctozepto)
