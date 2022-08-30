Hello everyone,

I would like to announce my candidacy for PTL of the Cinder project for the
Antelope cycle.

I served as the PTL for Cinder during the Zed development cycle and targeted
some of the areas which were lacking attention and worked on improving them
like:

1. Review Quality
Proposing the Efficient Review Guidelines[1] to help new contributors improve
the quality of reviews.

2. Security Vulnerabilities
Triaged the open security issues during the first mid cycle[2].

There are still areas which could be improved upon like 3rd Party
Compliance checks and Cinder driver documentation which are good candidates
of work items for the next development cycle and I look forward to actively
work on them.

Apart from that, there were deadlines which could have been better handled
which I would like to incorporate in my planning skills so we get things
merged in time and we won't have to extend deadlines frequently.

Overall, I feel it was a good learning experience being PTL for the first
time and I'm thankful for all the support I've had from the team, not to
mention the advice and help from Brian while making critical decisions, and
Hopefully I will take the learnings to be a better PTL this time.

[1] https://docs.openstack.org/cinder/latest/contributor/gerrit.html#efficient-review-guidelines
[2] https://etherpad.opendev.org/p/cinder-zed-midcycles#L136

Rajat Dhasmana (whoami-rajat)
