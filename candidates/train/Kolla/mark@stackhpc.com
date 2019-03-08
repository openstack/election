Hi,

I'd like to nominate myself to serve as the Kolla PTL for the Train cycle.

I've been a user and developer of Kolla and Kolla Ansible since 2016 -
initially while at Cray, but my upstream contribution really started in earnest
when I joined StackHPC two years ago. I became core in May last year.
I am passionate about this particularly operator-driven and community-led
project, and started the Kayobe [1] project that allows deployment of an
OpenStack control plane to bare metal using Kolla, Kolla Ansible and
Bifrost.

The flip side of being an operator-driven project is that contributors come and
go, and even regular contributors don't always have as much time as they might
like. That said, the project is very much alive in terms of code and review
contributions. I'd like to help those on the periphery of the project to get
more involved. Kolla is also a very global project, with many contributors in
Asia particularly. This is really healthy, and I'd like to try out a more
APAC-friendly IRC meeting time and a virtual PTG to keep everyone involved.

I'm lucky enough to also be an Ironic core (I don't intend for that to change
if elected Kolla PTL), and it's been interesting to compare how these two quite
different projects operate. The Ironic team does a great job of planning and
tracking their work, making use of a whiteboard [2].  I'd like to try adopting
a lightweight version of some of these practices in Kolla.

As the project matures, stability becomes increasingly important. This is
particularly true for the images, which are used by multiple projects. We've
been working on improving our CI testing this cycle, but still have a way to
go. I want to make sure that work continues, to ensure we can continue to make
changes with confidence, whatever the hype cycle throws at us.

Thanks for reading,
Mark Goddard (mgoddard)

[1] https://kayobe.readthedocs.io
[2] https://etherpad.openstack.org/p/IronicWhiteBoard
