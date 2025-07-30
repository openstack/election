Howdy folks,

It has been a year since you accepted me as a TC member but I'm now asking you
to continue to work on the Technical Committee.

First, in case you don't know me yet, I'm Sylvain Bauza (bauzas on IRC),
working on OpenStack since... wow, 11 years already ? I first started to test
OpenStack Diablo and Essex for a SME company but eventually moved to another
(and then another) position and became contributor, first to the Blazar (that
time named Climate) project and then Nova for 11 years now, eventually becoming
a nova-core member and the Nova PTL.

Last year was the first term for being a TC member and I did not have a lot of
time to dedicate at the beginning, but I tried my best to help the team and
learn how the TC works. This experience gave me a better understanding of the
challenges, and I feel more prepared and motivated to continue contributing to
the Technical Committee.

I want to continue shepherding the removal of eventlet for our projects, as I
believe this is an important step for the long-term maintainability while also 
ensuring that our operators have time for testing the performance impact of
such breaking but invisible change [1]

[1] https://review.opendev.org/c/openstack/governance/+/952903

Additionally, I want to continue to be part of the OpenStack
Vulnerability Management (VMT) Team as a TC liaison [2], so I can help ensure
our projects remain secure and responsive to new threats.

[2] https://wiki.openstack.org/wiki/CrossProjectLiaisons#Vulnerability_management

There are a few other things I really care about and wish to help improve.
CI gate stability is one of them. Having transient failures close to a
milestone is not a good experience for us and we need to really address
those failures as top priorities when they occur. We should somehow recognize
the very few who dedicate time on chasing those issues and fixing them, as
these contributors are most valuable, since not a single line of code can merge
when a gate is down.

Enough talk, I'll end here by saying that after those 11 years in the
community, I'm still enjoying being part of it and how much I do love working
with all of you.

Cheers,
-Sylvain
