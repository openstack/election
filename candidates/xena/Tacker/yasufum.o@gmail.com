Hi,

I'd like to propose my candidacy for Tacker PTL in Xena cycle.

In Wallaby release, we have released several features for the latest ETSI NFV
standard while largely updating infras, such as moving to Ubuntu 20.04,
supporting redhat distros again and dropping python2 completely for not only
Tacker but also related projects such as tosca-parser or heat-translator or so
[1]. In addition, we have fixed instability in unit and functional tests for
which we have troubles several times. As Tacker PTL, I've led the team by
proposing not only new features, but also things for driving the team such as
documentation or bug tracking.

In Xena cycle, I would like to continue to make Tacker be more useful product
for users interested in NFV. I believe Tacker will be a good reference
implementation for NFV standard. We have planed to make Tacker more feasible not
only for VM environment, but also container to meet requirements from
industries.

- Continue to implement the latest container technology with ETSI NFV standard.
- Introduce multi API versions to meet the requirements for operators enable to
  deploy mixed environment of multi-vendor products in which some products
  provide a stable version APIs while other products adopt move advanced ones.
- Proceed to design and implement test framework under development in ETSI NFV
  TST to improve the quality of the product, not only unit tests and
  functional tests, but also introduce more sophisticated scheme such as robot
  framework.

[1] https://docs.openstack.org/releasenotes/tacker/unreleased.html

Regards,
Yasufumi Ogawa
IRC: yasufum
