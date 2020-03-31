Dear Fellow OpenStackers,

I am Radosław Piliszek (yoctozepto) and I am proposing myself as a TC
candidate starting Victoria cycle.
For the record, I have never been in TC nor a PTL... yet.

I am affiliated with a relatively small Polish university: University of
Białystok, with the local Computing Centre offering services to local
academics. My experience is broad in that this work involves being
a whole IT department at once. :-)

OpenStack piqued my interest in 2018 when I joined the Foundation as
an individual member. Since then I made myself COA (Certified OpenStack
Administrator), learnt the jump from "administrator" to "operator" while
deploying locally various PoC instances of basic OpenStack services and
finally started contributing upstream via bug reports, patches and
reviews. I was (and am!) really proud to have been recognized Kolla core
due to my work with fellow project members. Later on, DevStack core
nomination followed for which I am grateful as well.

In the Kolla project I work mostly on ensuring sanity, enhancing testing
and fixing current issues while helping fellow contributors to deliver
their features and fixes. I also managed to deliver a bigger change
in the Train cycle: all-around IPv6-only networking support.

I enjoyed the cross-project aspect of this and decided to contribute
a bit to the development experience as well and this is how I ended up
DevStack core (true story).

Nowadays I am wearing multiple hats in the wide community and many of
you probably recognize me from IRC where I try to be helpful but also
ask questions around (often technical ones like: to be or not to be?).
One could say I'm inquisitive (hopefully in the good sense of this word)
and in fact I value highly a deeper insight into the problem at hand
(probably due to bad experience with hasty actions!). I react to issues
quite quickly (bothering infra from time to time - I am really sorry,
you folks are doing great job!) and work on solutions with fellow
OpenStackers (aka you) which brings real joy and makes experience real.

I have a few, rather broad, goals (or thoughts?) of mine:

1) To test, test and test. My motto is: "not tested = not working".
   Unfortunately, this is actually often the case in reality. :-(
   Hence, I encourage thorough testing, especially at the functional
   and integration level.
   I believe we need to be reliable to be trustworthy.

2) To make OpenStack easily consumable by small companies, especially
   in public academia but not only. Everyone deserves a good private
   cloud experience with decent learning curve. This involves prompt
   and current documentation but also reliable base for installs.

(1) and (2) culminate in (3) [1+2=3 - could not have been simpler!]

3) Who are we? BUILDERS! What do we want? TO BUILD!
   (I hope you know the meme!)
   Ultimately OpenStack is software built for specific purpose and is
   meant to be consumed by cloud operators. We have plenty of ways to
   get OpenStack "installed" but officially we still rely on the archaic
   assumption that everything is thrown in the same environment. This is
   rarely the case nowadays due to various layers of separation being
   applied: virtual envs, OCI images. It would be beneficial to be able
   to rely on prebuilt official images of OpenStack services and their
   prerequisites, also for CI. We don't need to rebuild/reinstall
   keystone, glance, nova and swift just to test neutron that one more
   time, only to discover pip hangs installing dep of dep of not-even-
   neutron due to random networking issue.* Similarly this is wasted
   effort in case of multinode testing. Multiply this by the amount
   of scenarios and... well, you probably get the picture. I know
   we can do better: deliver more reliability via more reliability.

   * Order random for example purposes.

This is as many relevant bits as I thought necessary to introduce
my candidacy and share my mind with you.

Thank you for reaching this far.

Radosław Piliszek (yoctozepto)
