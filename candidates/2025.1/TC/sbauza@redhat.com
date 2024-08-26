Howdy folks,

That's now been a long time I'm thinking about running for a TC seat but I
never really thought about it last cycle and then thanks to you I was elected.
Unfortunately I had to leave my seat due to a right concern but now I can ask
again you if you want to accept me as a TC member.

First, in case you don't know me yet, I'm Sylvain Bauza (bauzas on IRC),
working on OpenStack since... wow, 11 years already ? I first started to test
OpenStack Diablo and Essex for a SME company but eventually moved to another
(and then another) position and became contributor, first to the Blazar (that
time named Climate) project and then Nova for 10 years now, eventually becoming
nova-core and PTL.

Time flies and now I'm still there, happy with what OpenStack became. Of
course, it changed. But honestly, I haven't seen more operators using it
previously than now, which means that we succeeded as a team to make OpenStack
useful for our users. As a Nova PTL for the previous cycles, I know how
important it is to get feedback from our operators and how much this is crucial
to provide help for them.

The last discussions I had with the community led to me think that this motto
needs to be addressed as a whole and not only on a per-project basis, hence
convincing myself that I should run for a TC seat. As someone evolving from a
operations position in a SME company to a core developer working with large
cloud deployments, I wish I could help the TC driving some efforts into
shortening the feedback loop within the community. I'd also want to help the TC
provide some guidance on the new SLURP release cadence model to all the
projects so that we could really achieve a skip-release upgrade that would
benefit to our operators.

There are a couple of other stuff I do really care and I wish to help them.
CI gate stability is one of them. Having transient failures close to a
milestone is not a good experience for us and we need to really address
those failures as top priorities when they occur. We should somehow recognize
the very fews who dedicate time on chasing those issues and fixing them, as
their contributors are mostly valuable, since not a single code of code can't
merge when a gate is down.

Maintaining our code is another important aspect to me. Recent experiences on
not-so-well-maintained dependencies led us force to evaluate all the options
and those decisions aren't easy to make. As someone caring about maintaining
our code for stable releases, I wish I could help the TC to correctly identify
risks and benefits of breaking changes and evaluate the impact it may have
on our feature delivery.

Enough talk, I'll end up here, saying that after those 11 years in the
community, I'm still enjoying being part of it and how much I do love working
with all of you.

Cheers,
-Sylvain
