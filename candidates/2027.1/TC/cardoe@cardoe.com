Hello OpenStack,

I am announcing my candidacy for the OpenStack Technical Committee.

Two terms in, I've moved from learning how our governance works to
having a clearer sense of where it helps our projects and where it
gets in their way. I'd like a third term to spend on two specific
pieces of work rather than on broad goals.

For those that don't know me, I've been an active open-source
contributor and developer for over 20 years, spanning a range of
projects. I am currently an engineering leader at Rackspace, where
I'm focused on our data centers and bare metal systems being
accessible through OpenStack APIs. I am an active core to Ironic
and a core to OpenStack Helm while being an active contributor
to Neutron for bare metal networking efforts, OSC and focused
on modernization of tooling in a number of other projects.

Going forward this term I want to take on RBAC. Improving our
authorization model has been a multi-cycle effort and the results
are uneven across projects. That unevenness is a problem, with
some projects providing service wide objects behind one permission
and others behind another resulting in less granular options
available out of the box and well tested. I want to work with
the community on an actionable TC goal of improved RBAC and
scope usage.

The second is getting more contributors access to the projects they
work on. Most of our projects don't need more drive-by patches so
much as more people with review rights and the confidence to use
them. The barrier is usually social rather than technical: it isn't
written down how someone becomes core, small core teams don't have
the bandwidth to mentor, and contributors arriving from
organizations without upstream experience don't know what is
expected of them. I want to make that path explicit and make
growing a core team a normal thing rather than an exception. That
includes helping teams write down their expectations, encouraging
cross-project review help where a core team has gotten thin, and
continuing to press my own and other organizations to give their
people the time to do it.

When I first ran I spoke about engaging our corporate members. That
work continues: Rackspace remains actively involved and regularly
adds new contributors to different projects, and some organizations
that had been purely downstream are now upstream. I intend to keep
at it.

Overall, I want to see OpenStack continue as a healthy and vibrant
project, with tooling and governance that support our projects,
developers, and contributors rather than hinder them.

Thank you for your consideration.

Doug Goldstein
cardoe@cardoe.com
OFTC: cardoe
