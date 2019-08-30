Hello everyone,

I would like to announce my candidacy for Cinder PTL for the 'U' cycle.

The Cinder project is in a good state right now due to Jay Bryant's
leadership and a strong community of developers interested in keeping
Cinder stable and relevant.  The project has matured (which is a good
thing): a look at the cinder-specs repository shows an interest in
adding some features, but there's also a large focus on enhancing
existing features and introducing improvements to make the software more
reliable.  And the project's relevance has been continued by the
introduction of the cinderlib library that makes Cinder backend drivers
usable for applications beyond OpenStack, for example, by the Ember CSI
plugin for containers.

The Cinder project also faces some challenges.  Like all the major
OpenStack projects, over the past several cycles it has been showing a
decline in the number of contributors and in the diversity of their
affiliations.  Further, we had a big scare this cycle when it looked
like about half of the backend drivers would have to be marked
unsupported due to vendors not updating their third-party CI systems to
Python 3.  (As we approach milestone 3, happily, the situation is
looking better.)

Much as I'd like to say that as Cinder PTL, my scintillating personality
will reverse this trend, the reality is that the days of companies
renting out an entire museum in San Diego or Paris to entertain
OpenStack contributors are well behind us.  (Plus, I don't have a
scintillating personality.)  The positive way to look at this is that
our community has contracted to a hard core of sufficient density as the
effluvium is ejected, and we've reached a kind of steady state.

Thus I think the main task I would need to undertake as PTL is to focus
on nurturing the community we have.  This isn't to say that we won't
continue to do onboarding and outreach (we will), it's just that the
days when an OpenStack project could design features and people would
just show up and work on them are in the past.  So we need to make sure
that the current Cinder community--both developers working on the main
project and developers working on vendor drivers--feel well-connected
and valued.  (This isn't to say they don't feel that way now; my point
is that this is important to maintain.)

Concrete steps toward this goal are continuing Jay's good work in
keeping the Cinder community well-informed of the discussions at weekly
meetings, Forum sessions, the PTG, and midcycle, and taking advantage of
video meeting software so we can have more (virtual) face-to-face
meetings.

All this is sounds reasonable enough, but why me?  I'm a fairly new
member of the Cinder community.  I've been a Cinder core contributor
since April and have been helping with stable maintenance and releases.
I've had some experience as an OpenStack PTL (Glance PTL for O, P, and
Q), so I know what I'm getting into.  I'm an active participant in the
Cinder community, and if you'll have me as PTL, I promise to do my best
not to break anything.

Thank you for your consideration,
Brian Rosmaita (rosmaita)
