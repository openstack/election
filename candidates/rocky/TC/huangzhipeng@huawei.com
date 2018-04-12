Hi all,

I'm announcing my candidacy for the OpenStack Technical Committee.

I started following OpenStack community since Portland Summit in 2013, and has
been an integral part of it from then on. I'm currently serving as the PTL for
the Cyborg project [0] which provides general management framework for
accelerators. I'm also serving as the co-chair of the Public Cloud WG [1],
active member of the First Contact SIG [2] and had been a contributor for the
Interop WG throughout the year 2017 [3]. Outside of OpenStack, I'm one of the
founding co-leads for the Kubernetes Policy WG [4], the ecosystem lead for
OpenSDS community [5], and also served as the PTL of OPNFV Parser project from
2014 to 2016 [6]. I've also been involved with Open Service Broker API and SPDK
community where my team members are working on.

I would like to think my strength are in the areas like cross-community
collaboration, community team building, and non-stop innovation. I believe these
are also the areas that my future work on the Technical Committee should
continue to bring forth.

* Cross Community Collaboration *

For those of you who are familiar with my work, you would know that I've always
been taking a full stack approach for open source community work and strongly
believed the value of collaboration. From the very start building of the Cyborg
project, we collaborated with the OPNFV community and also had a concrete plan
on working with communities like Kubernetes, Linaro, ONNX and so forth. With my
work in OpenSDS, I've repeatedly emphasize the importance of the capability of
working with OpenStack and Kubernetes but not drop something and claim it would
be better to replace the existing module which has been built by a lot of
community work. During our discussions in the Kubernetes Policy WG on
multi-tenancy I've also introduced what the Keystone team has greatly done and
try to build a synergy there.

Hence if I were to be elected on the technical committee, I would like to
pushing further on the community collaborations within but not limited to the
following areas:
- Data model alignment regarding accelerator between OpenStack and Kubernetes
  via Cyborg project and the Resource Management SIG.
- Alignment regarding Policy architecture between OpenStack and Kubernetes via
  Kubernetes Policy WG as well as Keystone team.

* Community Team Building *

With currently busting the hype bubble, I've seen many commentaries on how
OpenStack "is getting outdated" and not "technically cool" any more. Set aside
the absurdity on the technical aspects, I think one of the core things people
will learn in the OpenStack community is the governance, the way how we work
here.

Take Cyborg for example, from day one I've been strictly following the four opens
principle and trying to build a good team structure by learning from great teams
like Nova, Cinder, Neutron, etc. The Cyborg project was started from basically
zero and I intentionally avoided any code dumping as we've seen in many open
source projects. We designed the specs from open discussion, wrote the codes with
public reviews and continue on. When few people believe even this could work, we
make it happen. The reward we are having is awesome, for example on nova-cyborg
collaboration, by not mandating certain design philosophy, we have great Nova
developers joining our project meeting from time to time, providing valuable
comments on how we better design the interaction, and help reviewing the specs.
I think for a new project I dare say we've got the best and logical architecture
design with regarding to nova interaction.

With that said, the community team building will be another important theme for
my future work on TC:
- Leveraging First Contact SIG, to try to incubate or help more project that
  knows how to build their team in a community way instead of a corporate way.
- Continue on the Cyborg team structure building, enable reasonable sub-team
  work and encourage more developers to join and contribute.
- Enabling more collaboration between projects and WG/SIGs. We have some good
  experience on Cyborg working with Scientific SIG as well as Public Cloud WG
  working with Nova/Keystone team, and I think we could make further progress on
  it

* Non Stop Innovation *

OpenStack offers the ultimate open source cloud computing infrastructure and
there are just so many exciting new things we could do with it. I've
experimenting the ideas of how Cyborg could better support AI application, and
also the possibility of utilizing blockchain for the Passport Program [7].
I plan to keep bring new things like these forward when given the opportunity to
serve on the  technical committee to make OpenStack's edge keep cutting as sharp
as ever :)

Thank you for your time to read such a long letter and please vote for me and
any other candidate that you see value in. A great community could not exist
without your important voice.

[0]https://governance.openstack.org/election/results/rocky/ptl.html
[1]https://wiki.openstack.org/wiki/PublicCloudWorkingGroup
[2]https://wiki.openstack.org/wiki/First_Contact_SIG
[3]https://review.openstack.org/#/q/project:openstack/interop+owner:%22Zhipeng+Huang+%253Chuangzhipeng%2540huawei.com%253E%22
[4]https://github.com/kubernetes/community/tree/master/wg-policy
[5]https://hannibalhuang.github.io/2017/12/27/opensds-official/
[6]https://hannibalhuang.github.io/2016/02/27/opnfv-parser/
[7]https://docs.google.com/presentation/d/1RYRq1YdYEoZ5KNKwlDDtnunMdoYRAHPjPslnng3VqcI/edit?usp=sharing

--
Zhipeng (Howard) Huang (zhipeng)
