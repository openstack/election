Hello everyone,

I'd like to announce my candidacy for Cinder PTL for the Xena cycle.

The primary challenge we face in the Cinder community is that our
reviewing bandwidth has declined at the same time third-party driver
contributions--new drivers, new features for existing drivers, and
driver bugfixes--have been increasing.  Similarly, we've been adding
better CI coverage (good) while at the same time our gate jobs have
become increasingly unstable (not due to the new tests, there are some
old failures which seem to be occurring more often).

We need to add some new core reviewers in Xena.  Luckily, some people
have been increasing their review participation recently, so there are
community members getting themselves into a position to help the project
in this capacity.  (And anyone else currently working on cinder project
who's interested becoming a cinder core, please contact me (or any of
the current cores) to discuss what the expectations are.)

We'll also be making it a priority to improve the gate jobs (or else
we'll never be able to get anything merged).

As far as community activity goes, the multiple virtual mid-cycle
meetings have continued to be productive, and the cinder meeting in
videoconference that we've been having once a month seems popular and
gives us a break from the strict IRC meeting format.  There's support to
make the Festival of XS Reviews a recurring event, and Sofia has
proposed holding a separate (short) bug meeting which we'll start doing
soon.  Hopefully all these events will help keep current contributors
engaged and make it easier for other people to participate more fully.

With respect to the details of Cinder development in Xena, I expect
those to emerge from our virtual PTG discussions in April.  You can help
set the agenda here:
  https://etherpad.opendev.org/p/xena-ptg-cinder-planning

Thanks for reading this far, and thank you for your consideration.


Brian Rosmaita (rosmaita)
