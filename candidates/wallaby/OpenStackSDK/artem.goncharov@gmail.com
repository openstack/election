Hi everybody!

I'd like to run for PTL of OpenStackSDK.

Things are not staying on the same place. We have slowed down a bit in the last
cycle, but surely not stopped. There is a bunch of changes to slowly start
switching nova parts of the OpenStackClient towards SDK. In some time we will
be able to complete this switch. This gives us lots of benefits from reduction
of maintenance efforts in the long run, down to having proper microversion
support in OSC out of box. We are not going to stop here and continue covering
all nova features in SDK/CLI and start doing same for other services similarly
to what we have already done with image service.

There are lots of further things to do like finalizing integration of keyring
support in SDK/OSC, improving caching capabilities, continuing featuring
project cleanup, streamlining more of ansible modules, finishing adding support
for Manila, Placement and so on and so on.

I would love to keep helping moving us further and getting things implemented
in the most effective way.

Thanks!
Artem
