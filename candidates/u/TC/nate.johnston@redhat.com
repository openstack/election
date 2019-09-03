Hello everyone,

I would like to nominate myself for a position on the OpenStack Technical
Committee.

I started working in OpenStack in the Kilo release.  I have always been focused
on the networking aspects of OpenStack, mostly from a telco perspective.  I had
a two-cycle absence during Ocata/Pike when my former employer made a strategic
decision to de-emphasize OpenStack.  But I came back a year ago, and now I am a
core reviewer for the Neutron project.  I have never served on the TC.

I deeply love OpenStack, the community of people that have come together to make
cloud technology available in a completely open way for the world.  It is
indisputable that OpenStack is a truly global project now.  I think the work
that lies ahead of us is to cement OpenStack's place as a fundamental building
block upon which future technologies are built.

Now that StarlingX, Zuul, and Airship are also under the OpenStack foundation I
think it will be more important for some of the strategic vision for the future
evolution of OpenStack to come from the TC.  Here are the main things I would
focus on as a member of the TC:

1.) IPv6-only cloud computing: The incredible proliferation of network
addressable devices will only accelerate.  Some forward-thinking enterprises are
already switching over to mostly, or entirely, IPv6 networking.  Here we have an
established advantage, as OpenStack supported IPv6 before any of the big public
clouds, and we can continue to lean into the future by providing a well tested
and documented IPv6-only option.

2.) A continued focus on Edge: Edge is not just for large enterprises with
hundreds of widely spread points of presence.  An edge deployment could also
serve a small-to-medium business with a thin presence in two remote locations.
The work to drive towards an edge architecture, combined with improvements in
stability and ease of use, will make OpenStack an option in new areas, and I
think that will be vitally important for our future.

3.) Making the experience of both operator and developer easier.  I think this
can be accomplished in a number of ways: by making the systems we use to develop
and test our code more similar to operational clouds by moving beyond Devstack
in the gate.

4.) Dealing with the contraction of the contributor community: There is much
more documentation around what happens when a project begins than for what
happens when it is no longer actively maintained.  I think there is a lot of
ambiguity that we ought to clear up for our users to clearly delineate a process
of stepping down support as a project loses vitality, so that we are clearly
communicating what they should expect from us as a community.

Thank you very much for reading, and for considering my candidacy.

Nate Johnston
IRC: njohnston
