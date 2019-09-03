Greetings Zorillas & other Stackers,

I would like to submit my candidacy to be the PTL of Manila for the Ussuri
cycle. I have been a contributor to OpenStack since the Liberty release and a
maintainer of Manila and its associated deliverables since the Ocata release. I
have had the opportunity to work closely with, and learn from, two stellar
engineers who have served as PTLs so far. I've also had the privilege of
collaborating with contributors from varied backgrounds. This
taught me the technical aspects of orchestrating Open Infrastructure Storage at
cloud scale. I attribute the tremendous growth of the project to each of us in
the project internalizing and espousing the "OpenStack Way" of upstream
open-source development. My strongest qualification for this job is that I wake
up excited about the problems we're solving. As an engineer I see features left
to implement; as an ambassador, I see untapped use cases; as a maintainer, I
see new contributors and technical debt. So, if you'll have me, as the PTL, I
will work towards maturing Manila, tackling its technical debt, advocating its
usage and sustaining its neutrality. I'll also continue doing the thing I love
most: mentoring new members and preserving this well-knit community.

In the near term, I propose that you and I:

- Continue hard on the path to growing contributors: Stein/Train was an
  exciting time for us; we worked hard on this goal! We lowered the barrier of
  entry for new contributors by relaxing our review norms [1] and provided
  quick and easy tutorials [2] to bootstrap with our free and open source
  storage drivers, among many other things. We had an opportunity to mentor
  interns under Outreachy [3], Google Summer of Code [4] and the Open
  University of Israel [5] internship programs. Let's do more of this and
  ensure we have able successors. Let's also mentor reviewers and create more
  maintainers.
- Complete integration to openstackclient/openstacksdk and evolve manila-csi by
  reaching feature parity to the rich feature-set we already provide.
- Continue the work on reliability, availability and fault tolerance of
  individual components and allow for more flexible deployment scenarios.
- Gather feedback from edge/telco/scientific computing consumers and address
  pain points.

Thank you for your support,

Goutham Pacha Ravi <gouthampravi@gmail.com>
IRC: gouthamr

[1] https://docs.openstack.org/manila/latest/contributor/manila-review-policy.html
[2] https://docs.openstack.org/manila/latest/contributor/development-environment-devstack.html
[3] https://www.outreachy.org/apply/rounds/may-2019-august-2019-outreachy-internships/#openstack-openstack-manila-integration-with-openstack-cli-os
[4] https://summerofcode.withgoogle.com/projects/#5067835716403200
[5] https://review.opendev.org/#/q/committer:gilboa.nir%2540gmail.com+status:merged
