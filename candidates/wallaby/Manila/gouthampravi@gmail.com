This is my candidacy to be the PTL for the OpenStack Manila
team through the Wallaby cycle. I am no longer a stranger to this role,
and I've had an excellent team to work with during the past two cycles that
serving as PTL has become an absolute pleasure besides being an honor. I've
learned by experience that a successful project leader is one that has a
great team.

I seek to lead an aspirational team that goes all distances to grow, as is
evidenced by every member spending a substantial amount of their time mentoring
new contributors, and providing an on-boarding ramp to OpenStack - whether this
is through informal introductions along the sidelines of conferences, or stray
explorers finding us on IRC/email, or engaging with invaluable supporters of
diversity and curiosity in the likes of Outreachy, Google Summer of Code, and
the Grace Hopper Celebration.

I seek to lead a committed team that wants to learn and better itself
continuously. We've adopted a proactive policy to bug triage that has kept us
rooted to users and their pain points; These bug triages have led to
effective (and fun) community "doc-a-thon" and "bug-a-thon" events. Many a
times, great effort does not result in great glory. I am proud of the work we
do to enhance e2e testing. There are no press releases that reflect this, but I
assure you that this work matters a lot to our users.

I seek to lead an informed team. Innovation arrives here often by standing on
the shoulders of the giants. The team works with technology that's been
perfected over decades, as well as with novel breakthroughs of the recent
years. We participate in adjacent communities, and adapt while also advocating
the lessons we learned in this one.

So, if you will have me, I wish to serve you through Wallaby and get things
done. Apart from our commitment to OpenStack-wide goals, and the improvements
we've charted out, I wish to prioritize a few more work items:

- Improve fault tolerance - we've identified some gaps in resource health
  when certain kinds of service disruptions occur, we'll fix these up.
- Achieve OpenStackCLI/SDK/UI parity - there's a lot left to do in this space,
  and we've actively been chipping away at this for the past two cycles.
- API policy improvements - work on the "admin-everywhere" problem with the
  pop-up team and support fine grained policies in tune with the model of
  multi-tenancy we cater to.

Thank you for your support,

Goutham Pacha Ravi <gouthampravi@gmail.com>
IRC: gouthamr

[1] http://lists.openstack.org/pipermail/openstack-discuss/2020-September/017661.html