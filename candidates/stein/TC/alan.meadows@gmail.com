Hello!

I am submitting my candidacy for the OpenStack Technical Committee.

I have been working with OpenStack in one form or another since the Bexar release. I have been
officially contributing to OpenStack since the Havana release cycle.  These contributions have
come in many forms -- from code contributions across many projects, to core reviewer on several
different projects, and finally in the form of countless discussions both online and offline in
the pursuit of making OpenStack the best it can be.

Most of my time working with OpenStack has been spent operating OpenStack at scale.  My first
exposure to OpenStack was architecting and building a standalone swift offering during the
Bexar/Cactus era -- one of the first few cloud companies to offer commercial swift object
storage at scale across several data centers.  Closer to the Grizzly cycle, I joined as a core
of the chef cookbook project helping to create many of the initial chef cookbooks for OpenStack
projects.   Fast forwarding a bit, I was given a chance to re-imagine how my company delivers
and manages IaaS software including OpenStack across hundreds of data centers, and so the
openstack-helm project was born.  I contributed heavily to this project including many of
the initial charts to get the vision off the ground and remain an active core.  I think this
project's mission -- which I helped to create -- stands as a testament to one of my core principles
of OpenStack: that OpenStack projects must think beyond a single company's use case and remain
extremely flexible to remain relevant.

To bring the vision full circle, I helped architect, build, and champion Airship as an opensource
project to the Open Stack Foundation -- a platform that enables to end-to-end delivery and
operation of projects like OpenStack-Helm but with the direct intention of thinking beyond just
OpenStack. OpenStack's ecosystem of containerization and orchestrations present a unique opportunity 
to facilitate working together, learning from each other, and benefiting from their commonalities.
Not only that, there is a unique opportunity with containerization to work more deeply across
communities and I look forward to helping facilitate that.

My goal since the beginning of my involvement with OpenStack has been bringing a production and
operator mindset to the OpenStack services.  This quest has taken several forms.  Early on, it
was in the form of cajoling projects into supporting more realistic production use cases where
things like resiliency and scale would be taken seriously[0].  Most recently, it has been finding
a way to lift OpenStack from its origins as a human driven devops platform where heavily experienced
OpenStack operators were required build and operate OpenStack deployments and into a new era where
software can become the sole intelligent actor in operating OpenStack.  This has meant pushing for
new cross-project concepts such as service health APIs that can allow software to make intelligent
decisions while managing OpenStack services[1][2].  To be sure, OpenStack is reaching a new
phase -- one where maturity and security are critical and the ease with which operators can manage,
deploy, upgrade, and consume its services is paramount for long-term success.  In the end, it is
this unique and hyper-focused outlook I hope to bring to the TC.

Thanks,

Alan Meadows

[0] http://lists.openstack.org/pipermail/openstack/2013-December/004221.html
[1] https://etherpad.openstack.org/p/cloud-native-forum (Boston)
[2] https://etherpad.openstack.org/p/sydney-cloud-native-partii (Sydney)
