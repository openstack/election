Hi all,

I'd like to submit my candidacy to be a member of the OpenStack Technical
Committee.

My involvement with OpenStack began during the Diablo release. Since then I've
participated in various parts of the community, in both upstream and downstream
roles. Today I mainly focus on authorization and identity management.

As your elected member of the Technical Committee, I plan to continue
advocating for cross-project initiatives and easing cross-project
collaboration wherever possible.

One area where I'm heavily invested in this type of work is improving
OpenStack's authorization system. For example, I've championed a community goal
[0], which eases policy maintenance and upgrades for operators. I've also
contributed to the improvement of oslo libraries, making it easier for other
services to change policies and consume authorization attributes. I believe
isolating policy from service-specific logic is crucial in letting developers
securely implement system-level and project-level APIs. Finally, I worked to
revive a thread from 2015 [1] that allows us to deliver better support for
default roles out-of-the-box [2]. This will reduce custom policies found in
most deployments, enabling better interoperability between clouds and push
OpenStack to be more self-service than it is today. There is still more work to
do, but all of this makes API protection easier to implement while giving more
functionality and security to end-users and operators.

Based upon the few examples shared above, I think it's imperative to approach
cross-project initiatives in a hands-on manner. As a member of the TC, I plan
to spend my time helping projects close the gap on goals accepted by the TC by
contributing to them directly. Additionally, I want to use that experience to
collaborate with others and find ways to make achieving efforts across projects
more common than it is today, as opposed to monolithic efforts that commonly
result in burnout and exhaustion for a select few people.

Tracking Rocky community goals specifically shows that 50% of projects are
still implementing, reviewing, or have yet to start mutable configuration. 61%
are in the same boat for removing usage of mox. Some efforts take years to
successfully complete across projects (e.g. volume multi-attach, adopting new
API versions).

Whether the initiatives are a focused effort between two projects, or a
community-wide goal, they provide significant value to everyone consuming,
deploying, or developing the software we write. I'm running for TC because I
want to do what I can to make cross-project interaction easier through
contributing and building necessary process as a TC member.

Thanks for reading through my candidacy. Safe travels to Denver and hopefully
I'll see you at the PTG.


Lance

[0] https://governance.openstack.org/tc/goals/queens/policy-in-code.html
[1] https://review.openstack.org/#/c/245629
[2] https://review.openstack.org/#/c/566377
