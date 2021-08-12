Hello Nova (and Placement) fellows,

That's been some time I started to work on OpenStack and Nova in particular
(I leave you guessing it [1]) but I feel this is time for me to run for the
Nova PTL election and ask you to accept me for this hot seat (which is not a
Yoga mat).

First and foremost, I'd like to thank gibi for the hard work he did on the
previous cycles, especially during this (hopefully) transient situation we
currently face which challenges us in terms of teamwork. Running our team
gatherings virtually twice is awfully exhausting and I also thank you all
for supporting this situation. Hopefully our next PTG will be the last virtual
one but who knows.

I personally feel Nova now entered a period of quiet but productive pace. We
accepted a solid amount of blueprints over the past cycles but we also
delivered a decent ratio of them. That said, many challenges occur as of now
which as a PTL I have the intention to continue to stress on and engage
discussions between us how to solve them :

 - CI stability : We recently faced a couple of bugs that prevented us to merge
   code and I have the feeling that some of them are intertwined. I'd like us
   to identify all the stressing bits so we could prioritize any kind of tech
   debt fix that would help to gain better stability and not treat them as
   just standard bugs that we only look after our feature delivery duties.

 - Upgrades : I'm very happy to say we solved the long-running problem of
   version-to-next upgrades which are now painless. We have a couple of tools
   for helping operators to gain confidence before upgrades and we also have CI
   jobs that prove their stability. That said, I personally feel we now have
   another dimension of upgrades we barely scratched to define and I would like
   us to think about them. Placement reshapes and fast-forward-upgrades are for
   example two new features that Nova supports but I'd like us to take a second
   and identify all the improvements we could make for those (and prioritize
   efforts accordingly)

 - Contributors diversity : I don't think there is any surprise if I say that
   our Nova community is smaller than before. I don't think it's a problem and
   as I already said, we're productive. No, the concern that I have is that I'd
   love to have a way to help contributors that are maybe not having time to
   develop on Nova as a primary day-to-day job. We started to discuss on ways
   to define review priorities and I would like to pursue this direction by
   wondering what and how we could do for those contributors.


Either way, I truly respect the ideal of Open Design. Whatever Nova becomes or
evolves in the future, every single contributor is part of it and my role will
be to make sure we have a consensus.

Thanks,
-Sylvain

[1] 0x7DD
