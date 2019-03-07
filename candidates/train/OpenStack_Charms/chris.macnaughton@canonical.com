Hello all,

I would like to announce my candidacy for PTL of the OpenStack Charms project.

Through my time contributing to the OpenStack Charms project as a core team
member, I have experienced working on many of the charms in both a bug-fix
and new feature capacity. Additionally, I have made upstream contributions
as needed.

The OpenStack Charms project has an increasing community both consuming the
charms, as well as contributing to them, and I think that it is important to
actively nurture this community. In addition to our user community, it is
important for OpenStack Charms members to integrate more widely in the
wider OpenStack community.

Some areas of focus for the Train cycle include:
- Expanded functional test coverage
  - Evaluate the use of upstream gate functionality to run tests
  - Great progress was made in the Stein cycle towards improving our new test
    framework, and that should continue
  - New scope should be added to track features available in tooling, allowing
    tests of new features, such as cross-model relations (CMR)
- Faster deployments
  - Tooling should be developed to track timings of deployments
  - Functional testing should be timed, allowing us to track and improve,
    resulting in less waiting to deploy a cloud
- [Multi-cycle] Continue to explore possibilities and methodologies for
  Classic -> layered Reactive Charm migrations
--
Chris MacNaughton