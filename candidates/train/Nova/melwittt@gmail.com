Dear Stackers,

It has been my privilege to serve as PTL of the Nova project over the Rocky and
Stein cycles, and I would be happy to serve another cycle, if you'll have me.

I remain most motivated by serving operators and users in our community. I
spend as much time as I can communicating with operators at the Summit Forum,
the PTG, and the #openstack-nova channel to answer questions, help with
problems, give guidance, obtain feedback, and make changes and improvements
based on their feedback. I am proud to say that we receive operator code
contributions regularly in Nova, and I want to do everything we can to keep it
that way or even increase it. Similarly, it's always great when operators
participate in our Summit Forum and/or PTG sessions. We always have
participation and I appreciate that. To operators: if there is anything I can
do to help you participate, please let me know.

Stein was a busy cycle, with one of the primary efforts being the placement
service extraction. This was an enormous change with significant impact on
operators, and I worked hard to ensure we had a plan that would consider the
consumers of our deliverables. I consulted with team members with expertise in
upgrades and deployment tooling and strove to find consensus among members of
different groups with different priorities.

We made a lot of progress on the placement extraction plan, but because upgrade
support and testing were not able to be implemented in deployment tools in
time, we did not delete the placement code from Nova in Stein. The placement
code is left as a bridge for operators in Stein, to be able to run with
integrated placement until we have upgrade support and testing and operators
feel ready to move to extracted placement. So, next cycle, we have a lot of
important cross-project work to do with deployment tools teams to coordinate
upgrades support and testing, and removal of the placement code from Nova. This
of the highest priority.

In Stein, I worked on two features focused on usability and operational
robustness: configurable maximum number of disk devices to attach to a single
instance and counting quota usage from placement (down/poor performing cell
resiliency). We landed only the data migration piece of the counting quota
usage series, but that positions us well to be able to migrate a lot of data in
Stein and start counting quota usage from placement in Train.

Next cycle, I want to focus on coordinating what deployment tools need to
support upgrading to extracted placement and deletion of the placement code in
Nova, project management duties, and bugs. It is essential that we get the
upgrade/extracted placement work squared away in Train, as early as possible.

Finally, cross-project efforts are important to me and I participate in
discussions whenever I can. I actively participated in most of the unified
limits/oslo.limit sessions at summit and PTG, to lend my experience working
with quotas in Nova to help those working on the design and implementation. And
recently, I had a productive discussion with Lance Bragstad about Keystone
authorization scopes, which resulted in him drafting this great document for
all of us: https://review.openstack.org/638563. I want to help drive adoption
of auth scopes in Nova, to help Nova become more self-service and enable
operators to let non-admin users have access to whatever APIs they choose.

Thanks for reading and thank you for your consideration.

Best,
-melanie
