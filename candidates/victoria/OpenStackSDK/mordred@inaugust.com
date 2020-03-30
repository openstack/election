Hi everybody!

I'd like to run for PTL of OpenStackSDK again.

We just merged the OpenStackClient and OpenStackSDK teams. While on the
one hand this is a nice big new challenge, I think it also presents an
excellent opportunity to accelerate our long-standing goal of integrating
the two more seamlessly. I'm excited to get some motion on that.

In this last cycle we finally got started on the long-awaited
python-*client-ectomy from OpenStackClient by removing glanceclient. I'm
hoping in the next cycle we can at least remove keystoneclient - but
I think we can pick up the pace now.

We need to streamline how config and arguments are parsed so that it's
100% consistent between OSC and SDK and Ansible. This is going to mean
using openstack.config in OpenStackClient more directly - and I think
it's going to mean an end to the double-auth dance. That, in turn,
will likely tie in to attempting to unwind the plugin structure from
entrypoints and laying in an optimization so that we can skip entrypoints
calls in most cases.

We've recently been more aggressive with adding new project-specific
cores and I'd like to continue that. We need to trust people from project
teams to help maintain relevant code in SDK and OSC, and as a result
get into the habit of getting support for new things into SDK and OSC
as a part of shipping them in the service.

That leads to our need to get to the point where both SDK and OpenStackClient
can speak to the latest microversion for the projects supporting microversions.
This has been mentioned as one of the things people from the projects don't
like about OSC vs the project-specific CLIs. The thing is, we will already
use the most recent microversion we understand - so we already behave like
people want us to. The thing we need to get to is understanding the MV
as it's added.

The momentum is picking up to get a lot accomplished, and I'd love to
keep helping to pushing these rocks uphill.

Thanks!
Monty
