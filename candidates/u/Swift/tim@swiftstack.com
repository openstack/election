I would be honored to continue serving you as Swift PTL.

This past cycle, we have laid the foundation for Swift's continued
success: we support running Swift on Python 3. This has been long
overdue, and a long time coming. While we first began to the process
four years ago, momentum has only really picked up for it in the last
year and a half. As of last week, all unit tests and functional tests
now run under py3.

It has been such a joy to see this project finally coming to a close.
We certainly benefited greatly by having four and a half years with
an exceptionally stable base to build upon, but now we have ensured
Swift's future deployability, maintainability, and longevity. John
Dickinson's long-time goal that Swift be used everywhere, every day,
by everyone could only hope to be fleeting without this community-
driven effort.

Speaking of, I'm so happy to see that the transition to storing Zuul
logs in Swift [1] has gone so smoothly. A half-dozen or so clusters
suddenly started ingesting millions more PUTs every day, and yet
Clark Boylan says he "[hasn't] heard complaints from the swift
clouds" -- I can think of few better compliments on the quality of
our software. :-)

With many millions of objects getting created every day and a median
object size in the tens of kilobytes, this emphasizes another years-
long project: OVH's work to optimize small-file workloads. Our next
focus should be to integrate their (already running in production!)
improvements back into master and disseminate their knowledge of how
to hack on, debug, deploy, monitor, and troubleshoot in a brave new
world. I look forward to organizing this effort in Ussuri.

Tim Burke

[1] http://lists.openstack.org/pipermail/openstack-discuss/2019-August/008516.html
