Hello folks!

I'd like to nominate myself for the TripleO PTL role for the Stein cycle.

Alex has done a great job as a PTL: The project is progressing nicely with many
new, exciting features and uses for TripleO coming to fruition recently. It's a
great time for the project. But, there's more work to be done.

I have served the TripleO community as a core-reviewer for some years now and,
more recently, by driving the Security Squad. This project has been a
great learning experience for me, both technically (I got to learn even more of
OpenStack) and community-wise. Now I wish to better serve the community further
by bringing my experiences into PTL role. While I have not yet served as PTL
for a project before,I'm eager to learn the ropes and help improve the
community that has been so influential on me.

For Stein, I would like to focus on:

* Increasing TripleO's usage in the testing of other projects
  Now that TripleO can deploy a standalone OpenStack installation, I hope it
  can be leveraged to add value to other projects' testing efforts. I hope this
  would subsequentially help increase TripleO's testing coverage, and reduce
  the footprint required for full-deployment testing.

* Technical Debt & simplification
  We've been working on simplifying the deployment story and battle technical
  depth -- let’s keep  this momentum going.  We've been running (mostly) fully
  containerized environments for a couple of releases now; I hope we can reduce
  the number of stacks we create, which would in turn simplify the project
  structure (at least on the t-h-t side). We should also aim for the most
  convergence we can achieve (e.g. CLI and UI workflows).

* CI and testing
  The project has made great progress regarding CI and testing; lets keep this
  moving forward and get developers easier ways to bring up testing
  environments for them to work on and to be able to reproduce CI jobs.

Thanks!

Juan Antonio Osorio Robles
IRC: jaosorior
email: jaosorior@gmail.com/jaosorior@redhat.com