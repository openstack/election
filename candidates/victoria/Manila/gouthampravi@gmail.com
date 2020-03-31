Greetings Zorillas & other Stackers,

I would like to submit my candidacy to be the PTL of Manila for the Victoria
cycle. I stepped up to this role for the Ussuri cycle and have had a tremendous
learning experience. I achieved numerous things I set out to do with the
support and encouragement of my fellow contributors. I'd like to continue in
this role and drive the growth of this project and its community.

In my role as the liaison for this community, I was able to effectively aid
internalizing the "OpenStack way" of development. The project and its many
deliverables saw several new contributors in the Ussuri cycle. This included
successful Outreachy and Google Summer of Code interns who continue to
contribute beyond the completion of their internships. We were able to prune
the core maintainers group to active reviewers while mentoring and adding
three new individuals. We also had a significant reduction in our bug backlog,
while we continue to farm out issues for potential first time contributors.
In the Victoria cycle, I plan to continue on this mission of growing the
contributor base, and having Manila be a great on-boarding project for the
OpenDev community.

In the Ussuri cycle, thanks to our Outreachy interns, their mentors and the
reviewers, we merged feature functionality to support the OpenStack Client.
Similar velocity was achieved in the manila-csi project through the GSoC
internship program and the continued investment beyond. We didn't get much
merged in the Ussuri cycle in terms of improving the availability and fault
tolerance of the core share-manager service. These multi-cycle work
items will remain a matter of focus and I'd devote time to drive these further.

The Ussuri cycle also saw reducing feature parity between the DHSS=True and
DHSS=False driver modes. This was a goal for this community for several
releases and it's coming to fruition through vendor-agnostic community driven
design. In Victoria, we plan to continue down this patch and eliminate further
feature gaps between many deployment and usability choices with Manila.

As PTL, I will drive the community through the OpenStack-wide goals during the
Victoria cycle, alongside some of our own:

- Graduating experimental features: We have had significant soak time for all
  three features (Share Replication, Share Migration and Share Groups); and we
  have begun the steps to take them out of their experimental state.
- Apply for the "vulnerability-managed" TC tag: As a community, we worked
  through our first CVE in Ussuri cycle with the aid and support from the
  OpenStack Vulnerability Management Team. In the Victoria cycle, we'll drive
  to achieve this TC tag for the project.
- Evolve bug triage criteria, and automate it: Seeing an unmanageable number of
  bugs is a distraction enough to ignore the bug backlog. As a community we
  discussed the idea of automating some triage tasks on our backlog.
- Address testing gaps: We'll continue to add new test case scenarios and
  address gaps such as the lack of scenario testing for the cephfs-native
  protocol. While this goal may not have a definition of done, it is here to
  convey my intention to prioritizing regression testing on par with feature
  development.

So, if you will have me, I wish to serve through Victoria and get things done.

Thank you for your support,

Goutham Pacha Ravi <gouthampravi@gmail.com>
IRC: gouthamr
