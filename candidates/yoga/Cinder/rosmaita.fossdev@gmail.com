Hello everyone,

I'd like to announce my candidacy for Cinder PTL for the Yoga cycle.

The primary challenge we face in the Cinder community continues to be
that our reviewing bandwidth has declined at the same time third-party
driver contributions have not decreased.  As I see it, the problem is
that many vendors who maintain third-party drivers do not appear to be
clear on the concept of community participation.  (For what it's
worth, I think this is more a manager problem than a developer
problem, but the effect on Cinder is the same, namely, lots of request
for reviews and not much doing of reviews.  The Cinder documentation
has information about how to review, how you don't need to be a core
to do valuable reviews, etc., but it's not clear that many people
have actually read them.)

The Cinder community has tried to address this participation deficit
in Xena by providing more upstream activities for contributors (for
example, the monthly Festival of XS reviews [0] and the weekly Bug
Squad meetings [1]), and these have had decent participation.  In
Yoga, I'd like to explore having some kind of Review Squad meeting to
give people a chance to get "live" feedback on features under
development.  Some people do use the weekly Cinder meeting for this,
but not everyone takes advantage of that, plus weekly meeting time is
limited.  I hate to propose yet another team meeting, but on the other
hand, the bug squad and festival of reviews meetings are extremely
productive, so I don't mind proposing another *productive* meeting.
(We'll simply cancel it if it turns out that people don't take
advantage.  Also, I'm open to other ideas ... the key issue is
providing faster feedback and more visibility for people developing
cinder features, and allowing cinder cores to use their review time
productively.  So two key issues.)

On the positive side, we did add a new cinder core during Xena and
there's another person right on the verge of being proposed as a core.
So that will help address review bandwidth, though I want to stress
that non-core reviews are extremely important to the project as well.
Our core reviewers also develop features and fix bugs--they are not
full-time code reviewers.  And the way to become a cinder core is to
review widely in the project and demonstrate a good breadth of
knowledge of the software.  (As always, anyone currently working on
cinder project who's interested becoming a cinder core, please contact
me (or any of the current cores) to discuss what the expectations
are.)

Also on the good side is that we've done quite a bit of work on the
Cinder CI this cycle.  (I'm not going to tempt fate by saying anything
more about that.)

With respect to the details of Cinder development in Yoga, I expect
those to emerge from our virtual PTG discussions in October.  You can
help set the agenda here:
  https://etherpad.opendev.org/p/yoga-ptg-cinder-planning

To summarize, I would like to continue working on improving the review
throughput of the Cinder team and find additional ways to get people more
thoroughly involved in the project.  Thanks for reading this far, and thank
you for your consideration.


Brian Rosmaita (rosmaita)

[0] http://eavesdrop.openstack.org/#Cinder_Festival_of_XS_Reviews
[1] http://eavesdrop.openstack.org/#Cinder_Bug_Squad_Meeting
