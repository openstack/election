Dear all,

I'm announcing my candidacy for a position on the OpenStack Technical
Committee.

I'm Rico Lin. I have been in this community since 2014. And been
deeply involved with technical contributions [1], I start from working
with heat, which allows me to work on integration and management resources
from multiple projects.
I have served as Heat PTL for two years. Which allows me to learn
better on how we can join users and operators' experiences and requirements
and integrated with development workflow and technical decision processes.


Here are my major goals with this seat in TC:
* Cross-community integrations (K8s, CloudFoundry, Ceph, OPNFV)
* Provide guidelines
* Strong the structure of SIGs
* Application Infra
* Cross-cooperation between Users, Operators, and Developers
* Diversity

I'm already trying to put my goals to actions, still would really hope to join
Technical Committee to bring more attention to those domains and get more
actions taken.

Thank you for your consideration.

Best Regards,
Rico Lin (ricolin)
IRC: ricolin
Twitter: @ricolintw
https://www.openstack.org/community/members/profile/33346/rico-lin
http://stackalytics.com/?release=all&user_id=rico-lin&metric=person-day


Here I put some explanations for my goals:

- Cross-community integrations (K8s, CloudFoundry, Ceph, OPNFV):
This is a long-term goal for our community, but would really like to see this
getting more scenario for use cases, and a more clear target for development.
As we talk about Edge, AI, etc. It's essential to bring real use cases
into this integration( like StarlingX bring some requirements cross-projects
to real use cases).
On the other hand, K8s-SIG, Self-healing sig, FEMDC SIG are all some nice
place for this kind of interacting and integrating to happen.


- Provide guidelines:
There is one WIP guideline from First Contact SIG I particular interesting
on. The `Guidelines for Organisations Contributing to OpenStack` [4]. This is
something I believe is quite important for showing how can organizations
interacting with OpenStack community correctly. I try to work on the same
goal from event to event as well (give presentations like [5]). There are some
other guidelines that need to update/renew as well (most of us, who already
reading ML and work in the community for long, might no longer require to read
guidelines, but remember, whoever try to join now a day, still require an
up-to-date guideline to give them hints).


- Strong the structure of SIGs:
As I show in above two goals, SIGs plays some important roles. I do like to
trigger discussions on how can we strengthen the structure of SIGs. Make them more
efficient and become someplace for users and ops can directly interact with
developers. For real use cases like an Edge computing use case issue, or an
atomatic healing service issue. I can't think of a better place than FEMDC SIG
and Self-healing SIG to record and target these issues. We might be able to
allow Opts to feedback issues on SIG's StoryBoard and ask project teams to
connect and review with it. There might be multiple ways to do this. So
would really like to trigger this discussion.


- Application Infra:
We've updated our resolution with [3] and saying we care about what
applications needs on top of OpenStack. As for jobs from few projects are
taking the role and thinking about what application needs, we should provide
help with setting up community goals, making resolutions, or define what are
top priority applications (can be a short-term definition) we need to focus on
and taking action items/guidelines and finding weaknesses, so others from
the community can follow (if they agree with the goals, but got no idea on what
they can help, IMO this will be a good stuff).

- Cross-cooperation between Users, Operators, and Developers:
We have been losing some communication cross Users, Operators, and Developers.
And it's never a good thing when users can share use cases, ops shares
experiences, developers shares code, but they won't make it to one another not
if a user provides developers by them self. In this case, works like StoryBoard
should be in our first priority. We need a more solid way to bring user feedback
to developers, so we can actually learn what's working or not for each
feature. And maybe it's considerable, to strengthen the communication between
TCs and UCs (User Committee). We take some steps (like merge PTG and
Ops-meetup) to this goal, but I believe we can make the interacting more active.

- Diversity:
The math is easy. [2] shows we got around one-third of users from Asia (with
75% of users in China). Also IIRC, around the same percentage of developers.
But we got 0 in TC. The actual works are hard. We need forwards our
technical guideline to developers in Asia and provide chances to get more
feedback from them, so we can provide better technical resolutions which
should be able to tight developers all together. Which I think I'm a good
candidate for this.


[1] http://stackalytics.com/?release=all&user_id=rico-lin&metric=person-day
[2] https://www.openstack.org/assets/survey/OpenStack-User-Survey-Nov17.pdf
[3] https://review.openstack.org/#/c/447031/5/resolutions/20170317-cloud-applications-mission.rst
[4] http://lists.openstack.org/pipermail/openstack-dev/2018-August/134072.html
[5] https://www.slideshare.net/GuanYuLin1/embrace-community-embrace-a-better-life
