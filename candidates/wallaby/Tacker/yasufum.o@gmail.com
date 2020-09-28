Hi,

I'd like to propose my candidacy for Tacker PTL in Wallaby cycle.

In Victoria release, we have released great features required for the
latest ETSI NFV standard and made several improvements for Tacker as and
as planed in the last vPTG. We also fix issues for migrating to python3
and Ubuntu focal. As a PTL, I've led the team by proposing not only new
features, but also things for driving the team such as documentation or
bug tracking. It was something hard, but is running well.

In Wallaby cycle, I would like to continue to make Tacker be more useful
product from not only telco, but also all users interested in NFV. I
believe Tacker will be a good reference implementation for NFV standard.
We have planed to make Tacker more feasible not only for VM environment,
but also container to meet requirements from industries.

- Introduce the latest container technology with ETSI NFV standard.
- Reinforce test environment for keeping the quality of the product, not
  only unit tests and functional tests, but also introduce more
  sophisticated scheme such as robot framework.
- Revise wiki and documentation for covering users more.

Regards,
Yasufumi Ogawa
