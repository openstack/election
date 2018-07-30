Hello Stackers,

I'd like to announce my candidacy for PTL of Nova for the Stein cycle. I feel
like Rocky has been a whirlwind of a cycle with a lot of active participation
by developers, operators, and users. Thank you all for bearing with me for the
past cycle as I have learned the ropes of being a PTL.

We accomplished a lot in Rocky, with some highlights including:

* Experimented with a new review process, "review runways"
* Began using the new Neutron port binding API to minimize network downtime
* during live migrations
* Completed the placement side of nested resource providers (Nova integration
  work still remains)
* Volume-backed instances will no longer claim root_gb for new instances and
  existing instances will heal during move operations
* Made progress on removing nova-network-specific REST APIs
* Added a  nova-manage command to purge archived shadow table data
* Doing more pre-filtering in placement before we iterate over compute host
  candidates with FilterScheduler filters
* Added the ability to boot instances with trusted virtual functions
* Added the ability to disable a cell in cells v2 Added a way to mitigate
  Meltdown/Spectre performance degradation via cpu flags

Looking toward Stein, we have more work to do with integrating placement nested
resource providers into Nova, implementing migration of flat resource providers
=> nested tree-based resource providers in placement, adding more resiliency in
cells v2 for handling "down" or poorer performing cells, removing nova-network,
and more to be discussed and prioritized at the PTG [1].

It would be my privilege to serve the Nova community for another cycle and if
elected, I endeavor to do a better job using what I have learned during the
Rocky cycle. I am always trying to improve, so please feel free to share your
feedback with me.

Thank you for your consideration.

Best,
-melanie

[1] https://etherpad.openstack.org/p/nova-ptg-stein
