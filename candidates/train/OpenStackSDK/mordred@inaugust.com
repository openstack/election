Hi everybody!

I'd like to run for PTL of OpenStackSDK again.

We've been angling for a 1.0 release for the last few cycles and still haven't
gotten there. We haven't gotten there because as we continue to merge in the
shade logic, we've been finding places where we need to make some fundamental
changes to the model.

For instance, we made all Resource objects also behave like dicts, so that
shade methods could return Resource objects directly. In order to do that,
we had to rename the 'update' method on Resource objects to 'commit', since
dicts have an update method already.

We're currently in the midst of moving a good amount of the shade logic
into the Proxy layer, so that uploading an image via the shade api or the
proxy api is using the same code. That will be ongoing but should mostly
be non-disruptive.

I believe we're close enough, and have enough of a co-gating relationship
with openstackclient, that this next cycle we need to start the work of
shifting openstackclient implemention to openstacksdk from the python clients.
Doing this should help us shake out any last remaining model deficiencies.

We managed to get several long-standing todo list items done this past
cycle. Cinder v3 support landed. Finally. We're also microversioning the
Ironic calls, and have a good framework in place to do so with the
other services as needed.

We got the FairSemaphore feature added to keystoneauth which lets us
remove the TaskManager and instead rely on an applications existing
concurrency mechanism to handle parallelism while retaining our ability
to perform client-side rate limiting. This change was actually inspired
by some issues we saw in the field with Nodepool and the extra overhead
from the TaskManager thread pool, but should end up facilitating more
efficient use of openstacksdk constructs in OpenStack services using
eventlet or other non-thread based concurrency systems.

We still need to overhaul the caching layer. But once TaskManager is out
we should be in a better place to deal with that.

I'm sure there will be more things to do too. There always are.

In any case, I'd love to keep helping to pushing these rocks uphill.

Thanks!
Monty
