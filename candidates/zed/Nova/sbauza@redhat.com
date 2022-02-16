Hello again Nova (and Placement) fellows,

This went fast, but it's time for me to run again for the Nova PTL position,
this time for the Zen/Zombie/Zeta [1] release cycle, after having been the PTL
for the Yoga cycle.

Just a quick look at this current cycle. First, it was quick but :

 - we added a new way to help contributors to say they are reviewing some
   change
 - we now have a new nova-core
 - we have around 25 accepted feature requests and 15 of them are already
   reviewed.


What we had't yet time to discuss and what I'd like us to start to look are :

 - given some operators want to upgrade at least every year, we should try
   to start seeing how to support two-cycle-older computes

 - sometimes we want to do things that we'd like but that we don't have
   time for. Some of them are actually simple to implement. Maybe then
   we should organize back ways to share ideas to new contributors and
   provide them mentoring efforts (eg. with Outreachy or any engineering
   interns wanting to work on OpenStack and Nova in particular)

As you know, I'm also open to any idea. I'm not a leader, I'm just a herder.

Thanks,
-Sylvain

[1] Pick any Z name you want given we don't know yet the result.
