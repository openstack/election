Hi everybody!

I'd like to run for PTL of OpenStackSDK again.

This last cycle was great. os-client-config is now just a thin wrapper
around openstacksdk. shade still has a bunch of code, but the shade
OpenStackCloud object is a subclass of openstack.connection.Connection,
so we're in good position to turn shade into a thin wrapper.

Ansible and nodepool are now using openstacksdk directly rather than
shade and os-client-config. python-openstackclient is also now using
openstacksdk for config instead of os-client-config. We were able to push
some of the special osc code down into keystoneauth so that it gets its
session directly from openstacksdk now too.

We plumbed os-service-types in to the config layer so that people can
use any of the official aliases for a service in their config. Microversion
discovery was added - and we actually even are using it for at least one
method (way to be excited, right?)

I said last time that we needed to get a 1.0 out during this cycle and we
did not accomplish that.

Moving forward my number one priority for the Stein cycle is to get the 1.0
release cut, hopefully very early in the cycle. We need to finish plumbing
discovery through everywhere, and we need to rationalize the Resource objects
and the shade munch objects. As soon as those two are done, 1.0 here we come.

After we've got a 1.0, I think we should focus on getting
python-openstackclient starting to use more of openstacksdk. I'd also like to
start getting services using openstacksdk so that we can start reducing the
number of moving parts everywhere.

We have cross-testing with the upstream Ansible modules. We should move the
test playbooks themselves out of the openstacksdk repo and into the Ansible
repo.

The caching layer needs an overhaul. What's there was written with
nodepool in mind, and is **heavily** relied on in the gate. We can't break
that, but it's not super friendly for people who are not nodepool (which is
most people)

I'd like to start moving methods from the shade layer into the sdk
proxy layer and, where it makes sense, make the shade layer simple passthrough
calls to the proxy layer. We really shouldn't have two different methods for
uploading images to a cloud, for instance.

Finally, we have some AMAZING docs - but with the merging of shade and
os-client-config the overview leaves much to be desired in terms of leading
people towards making the right choices. It would be great to get that cleaned
up.

I'm sure there will be more things to do too. There always are.

In any case, I'd love to keep helping to pushing these rocks uphill.

Thanks!
Monty
