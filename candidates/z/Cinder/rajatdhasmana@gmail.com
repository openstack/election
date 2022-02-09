Hi All,

I would like to announce my candidacy for PTL of the Cinder project for the
Z cycle.

Since this is the first time I'm proposing my candidacy, I would like to
briefly introduce myself. I started contributing to OpenStack back in the
Queens release (although not very actively) and started focusing on the
Cinder project in the Rocky release. I became a core reviewer in Cinder in
the mid of the Stein release and since then I've been actively contributing
to the Cinder project in terms of features, bug fixes, reviews etc. I'm also
a part of Cinder's core security group and a stable core and currently serving
as release liaison for Cinder for the past 3 releases.

Coming to the focus for the Z release, Cinder receives an abundance of commits
every cycle in terms of new drivers, driver features, core cinder features,
bug fixes, improvements etc and we've always faced a shortage in reviews.
It is not due to fewer people working actively but more of a priority issue in
their respective roles. I would like to encourage contributors to discuss with
their managers about the importance of code review in opensource and how it is
helpful for the community and the individuals as well.

Apart from that, I would like to revisit the security issues backlog since
that hasn't been looked upon in quite some time and if we encounter something
that needs attention, we can also hold core security meetings from time to
time to address the issues.

We are also getting active driver contributions every cycle which is a good
thing, but sadly the driver implementation patches seem to have a lot of
mistakes which are well documented in the driver contribution docs and
something I would like to highlight in the Z PTG (as most of the vendors
join it and propose their driver ideas). Again, the documentation is not
perfect as we discussed in Yoga PTG.  Following up upon this and improving
it is another focus I support for Cinder.

Lastly, I would like to put more emphasis upon the 3rd Party CI compliance
check which we haven't done in a while and it would be good to know how many
vendors are actually maintaining their CI consistently.

There are some new ideas started by Brian in the past releases which I would
like to continue. Some examples include the last cinder meeting being a
video+IRC meeting and every third Friday of the month, we have a festival of
XS reviews which significantly reduced the backlog of open patches.

In the end, I would like to say, I want to continue the good trends set in the
Cinder community and improve on certain areas where there is not much
attention being given.  I will do my best to address the above mentioned items
during my time as PTL. Thanks for considering me.

Rajat Dhasmana (whoami-rajat)
