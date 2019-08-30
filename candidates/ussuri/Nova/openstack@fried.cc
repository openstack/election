I would be honored to continue serving as the Nova PTL in the Ussuri release.

Please note that I will not be in Shanghai. As Train PTL, I am working to
delegate the project update [1]. If reelected for Ussuri, I intend to do the
same for PTG responsibilities, including doing as much as possible via "virtual
pre-PTG" on the mailing list.

Being PTL for Train has been a growth experience. It has forced me to take a
broader view of the project versus my previous focus on my topics of interest
[2]. The flip-side is that I have had less time to devote to those things, and
that has been a sacrifice. As such, I intend to be bolder about delegating this
time around.

In my stump speech for Train [3] I expressed a desire to grow contributor
participation. I feel we have seen positive movement with new and existing
non-cores showing improved code and review activity. Let's maintain the
encouraging atmosphere and continue to grow in this space.

However, core participation has not seen the same health, and it shows in the
relatively low volume of feature work that has been accomplished to date in
Train (more on this below). This has been one of my main frustrations as Nova
Cat-Herder: like cats, Nova cores are mysterious beings motivated by forces
beyond my ability to control. I would like to find ways to make core review
activity more consistent as a step toward being able to predict more accurately
what we can expect to get done in a cycle. This should make everyone's
(project) managers happier, a delicious treat made with real tuna.

Feature-wise, I was disappointed in the lack of progress exploiting nested
resource providers. The Placement team worked hard to deliver the dependencies
[4] to allow us to express things like subtree affinity for NUMA, but Nova
missed the boat (train) due to lack of resource [5] and inability to agree on
how to move forward [6]. Expressing NUMA in Placement is going to be the next
major inflection point for scheduling robustness and performance; we need to
get serious about making it a priority.

But first we should finish what we started, closing on the many almost-there
features that are looking risky for Train. We should be conservative about
committing to new features until those are done.

Thanks,
Eric Fried (efried)
(say it like "freed")

[1] http://lists.openstack.org/pipermail/openstack-discuss/2019-August/thread.html#8459
[2] meaning things my employer cares about, areas where I have
background/expertise, and things that sound fun and/or further some mission of
Nova/OpenStack
[3] https://opendev.org/openstack/election/src/branch/master/candidates/train/Nova/openstack@fried.cc
[4] https://docs.openstack.org/placement/latest/specs/train/approved/2005575-nested-magic-1.html
[5] insert Placement joke here
[6] https://review.opendev.org/#/c/650963/
