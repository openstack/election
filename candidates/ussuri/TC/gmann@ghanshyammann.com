Hello Everyone,

I would like to announce my candidacy for OpenStack Technical Committee
position.

First of all, thanks for giving me the opportunity as the technical
committee in the previous term. It has been a learning process for me
to understand the community and its technicality in a much broader way.
There are a lot of things to do for me which I targetted
last year but not finished.

I am fortunate to work in this community which help me to learn a lot
on daily basis. While being a TC, I got more opportunities to talk and
work with multiple projects and awesome contributors. Thank you
everyone for your support and hardwork.

Along with my QA and Nova role, I tried to target broader and cross
projects work as my TC responsibility. Migrating the OpenStack CI/CD
from Xenial to Bionic, updating the python testing, a current ongoing
community goal of IPv6 deployment and testing are the main work as
part of this. Obviously it is not necessary to be a TC to do
community-wide work but as TC it gives more understanding and actual
benefits as overall.

For those who do not know,  let me introduce myself.  I have joined
the OpenStack community since 2012 as operator and started as a
full-time upstream contributor since 2014 during mid of Ice-House
release. Currently, I am PTL for the QA Program since the Rocky cycle
and active contributor in QA projects and Nova. Also, I have been
randomly contributing in many other projects for example, to Tempest
plugins for bug fix and tempest compatibility changes.

Along with that, I am actively involved in programs helping new
contributors in OpenStack.
1. As a mentor in the Upstream Institute Training since Barcelona
Summit (Oct 2016)[1].
2. FirstContact SIG [2] to help new contributors to onboard in
OpenStack.
It's always a great experience to introduce OpenStack upstream workflow
to new contributors and encourage them to start contribution. I feel
that is very much needed in OpenStack.  Hosting Upstream Training in
Tokyo was a great experience.

TC direction has always been valuable and helps to keep the common
standards in OpenStack. There are always room for improvements and so
does in TC. In the last cycle, TC started an effort to ask the
community about "what they expect from TC" but I think we did not
get much feedback from the community. But these kind of effort are
really great and I think making these practice in every cycle or year
is needed.

This is my personal interest or opinion. As TC, which is there to set
and govern the technical direction and common standard in OpenStack, I
think we should also participate in doing more coding. Every TC members
are from some projects and contribute a lot of code there. But as TC
let's make a practice to do more coding for community-wide efforts.
Getting the use case or common problem from users and try to fix them by
themselves if no one there. There is no restriction of doing that
currently but making this as practice will help the community.

Let me list down the area I want to work in my second TC term as well
(few are continue from my last term target and few new):

* Share Project teams work for Common Goals:  This is very important
for me as TC and I tried to do this at some extent. I helped on
OpenStack gate testing migration from Xenial to Bionic and also I am
doing the IPv6 community goal in Train cycle. My strategy is always to
do the things by myself if there is no one there instead of keeping
things in the backlog. I will be continuing this effort as much as
possible.

* Users/Operators and Developers interaction:  Users and Operators
are the most important part of any product and improving the users
and developers interaction is much needed for any software. I still
feel we are lacking in this area. There are few projects which get user
feedback from time to time. Nova is great example to see many users
or operators engaged with developers as direct contribution or meetup
or ML etc. There are many other projects which are doing good in this
area. But there are many projects who do not have much interaction or
feedback from users. I would like to try a few ideas to improve this.
Not just project-wise but as overall OpenStack.

* TC and Developers interaction: There is good amount of effort to
improve the interaction between PTL and TC in last couple of years.
Health tracker was a good example and now TC Liasion. I would like
to extend this interaction to each developer, not just PTL. We need
some practical mechanism to have frequent discussions between TC and
developers. At this stage, I do not know how to do that but I will be
working on this in my next term. One way is to help them in term of
coding, user feedback etc and then encourage them to take part in TC
engagements.

Thank you for reading and considerating my candidacy.

Refernce: 
* Blogs: https://ghanshyammann.com
* Review:  http://stackalytics.com/?release=all&metric=marks&user_id=ghanshyammann&project_type=all
* Commit:   http://stackalytics.com/?release=all&metric=commits&user_id=ghanshyammann&project_type=all
* Foundation Profile: https://www.openstack.org/community/members/profile/6461
* IRC (Freenode): gmann

[1] https://wiki.openstack.org/wiki/OpenStack_Upstream_Institute_Occasions
      https://wiki.openstack.org/wiki/OpenStack_Upstream_Institute
[2] https://wiki.openstack.org/wiki/First_Contact_SIG

- Ghanshyam Mann (gmann)
