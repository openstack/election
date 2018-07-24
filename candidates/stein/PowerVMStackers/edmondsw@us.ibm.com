I am announcing my candidacy for PowerVMStackers PTL for the Stein
release cycle.

I have been working on OpenStack for several years now. I started out
mostly involved with keystone but I have contributed to a wide range
of projects over the years. More recently I pushed for formal
recognition of the *-powervm projects and PowerVMStackers was born.
I served as the PowerVMStackers PTL for the Rocky release cycle, its
first as an official project, and I would be honored to continue in
that role for another term.

During the Rocky cycle we have made good progress porting PowerVM
driver functionality from nova-powervm into nova proper. I intend
to continue to make that a priority going forward.

I would also like to see our documentation moved from readthedocs.io
to docs.openstack.org and generally improved. We have made a few
improvements in Rocky but there is a lot more that can be done there.

I am looking forward to diving in with the team and determining what
our development priorities will be for Stein. I expect one of these
to be a continuation of the device passthrough work that is beginning
in Rocky.

And of course as always, we need to maintain nova-powervm,
networking-powervm, and ceilometer-powervm as changes happen in their
parent projects (nova, neutron, and ceilometer), bugs are opened, etc.

I've very much enjoyed being part of this team. I'm encouraged to see
some new folks showing interest in our work, and I hope to see that
continue.  I will do whatever is within my power to see that it does.
If anyone is looking for help or has any questions, find me on irc as
edmondsw.

 - Matthew Edmonds
