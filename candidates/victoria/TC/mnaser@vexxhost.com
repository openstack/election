Hi everyone,

I want to run again for the OpenStack technical committee for the upcoming cycle.

I have been a long time operator of OpenStack with a focus on never using a
local for, which has resulted in my involvement with many different projects
by making quality-of-life improvements for these services that can help other
deployers.

I've contributed and worked with different sizes of teams inside OpenStack.
From our big projects such as Nova to projects providing specific services
such as Magnum and pretty much most deployments tools at this point.

On the operator side, I've helped run one of the longest-running OpenStack
public clouds and many private clouds.  I've also interacted with many other
OpenStack operators that are not as involved in our community, which gives me
a significant exposure to our operator story and what that looks like outside
our community of known operators.

I believe it's time now for me to start driving significant changes in our
community to simplify the operator experience, and I think that should start
from the technical committee.  We're seeing the world evolve around us with
new technologies, but we've remained relatively stable and stuck to
our "known and trusted" stack.

Operators have historically had a lot of frustrations with systems like
RabbitMQ and their clustering issues, which end up making the OpenStack
experience disappointing.  There are many new ways of doing RPC, which we can
leverage and help make it even easier to run OpenStack (things such as gRPC).

We've also had a history of making it complicated to use containers to deploy
OpenStack and historically refused to ship "official" containers.  The OpenDev
community has built our a step of tooling that can allow us to ship containers
very quickly, with nothing more than a well written bindep.txt file and a
simple multi-stage build.  It's about time that we start having official images
and easy ways to deploy OpenStack to reduce those barriers.

We define OpenStack as a "cloud operating system."  We struggle to deliver much
more than the essential infrastructure components.  The drive behind OpenStack
was to allow people to get more than the necessary infrastructure components.
Still, large amounts of different efforts lead us into complicated ways of having
to wrangle VMs to run services.

With popular container orchestrators and schedulers, OpenStack has a perfect
platform to be able to launch those services.  By setting up a proper framework,
we can start delivering many services such as database as a service, memory store
as a service, and so much more by building out Kubernetes operators.  It also
opens up a whole domain of possible contributors that can use those operators
without OpenStack.

In closing, I don't expect everyone to agree with all the different ideas I'm
putting out.  We may only drive just a few of them, or maybe none of them.
However, I want to convince you that we need to change.  I can understand they
sound like big leaps, and they may seem uncomfortable.  However, they are
genuinely some of the things we need to do to continue to be relevant and put
us at the leading edge of technology like we used to be years ago.

Thank you for reading this.

Regards,
Mohammed