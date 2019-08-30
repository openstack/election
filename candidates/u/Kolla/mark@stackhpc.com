Hi,

I'd like to nominate myself to serve as the Kolla PTL for the Ussuri cycle.

I have been PTL for the Train cycle, and would like the opportunity to continue
to lead the team. In my Train nomination [1] I proposed a few things,
including:

* help those on the periphery of the project get more involved
* try a new meeting time
* hold a virtual PTG
* adopt some of ironic's planning and tracking processes
* continue improving CI testing

During the cycle we have helped a number of new contributors get involved, and
have taken on a new core contributor who is already one of the most active
members. We polled for a new meeting time but found we were already optimal.
The virtual PTG helped us to prioritise our efforts, and I expect we'll hold
another this cycle.

We now use a whiteboard [2] similar to ironic's, and went through a process of
prioritisation of features for this cycle which we continue to use to guide our
efforts. Finally, CI test coverage continues to improve - notably the new
multinode upgrade job caught a pretty nasty MariaDB upgrade bug that we might
not otherwise have spotted before release.

If elected this cycle I'd like to continue to reflect on our processes, and
encourage increasing test coverage for further stability.  We recently added
Kayobe [3] as a project deliverable, and I intend to ensure that these two
overlapping communities come together effectively to make the most effective
use of our combined resources.

Thanks for reading,
Mark Goddard (mgoddard)

[1] http://lists.openstack.org/pipermail/openstack-discuss/2019-March/003617.html
[2] https://etherpad.openstack.org/p/KollaWhiteBoard
[3] https://docs.openstack.org/kayobe
