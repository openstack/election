Hi Team,

I would like to express my interest in continuing to serve as PTL of Cyborg
project for Wallaby release.

In the Victoria release, cyborg has merged 8 of the 13 scheduled goals[1]
and moved forward in different aspects:
  - Two more nova operations * Rebuild and * Evacuate are supported.
  - Program API is supported, now users can program FPGA given the
    pre-uploaded bitstream.
  - Two more new drivers are supported(Intel QAT and Inspur FPGA)
    And the third-party CI support discussion reached an aggrement
    that vendors should provided a up-to-date test report on the
    driver page to show their device's usability.
  - New default policy for API check is introduced.
  - Cyborg wiki pages is greatly improved.


Looking forward in wallaby release,here is a list of things we
will try to accomplish:
  - Continue to improve FPGA programming and test in production.
  - Continue to support nova operations like suspend/resume,shelve/unshelve.
  - Work with nova to support Mdev device mangament.
  - Work with nova neutron to suppport SmartNIC Integration.
  - Improve current tempest tests to improve quality and stability.
  - Improve our current cyborg doc page guides.


[1]https://wiki.openstack.org/wiki/Cyborg/Victoria_Release_Schedule

Thank you
Regards,
Yumeng Bao<yumeng_bao@yahoo.com>(irc:Yumeng)

