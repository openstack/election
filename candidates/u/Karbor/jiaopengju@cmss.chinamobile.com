Hi all,

I'd like to nominate myself to continue to serve as Karbor PTL for the Ussuri
cycle.

In Train, We added some new features for Karbor, like image boot server backup
(with new data added) and events notifications. Besides the new features, we
mainly focused on fixing bug and improving the coverage of unit tests. At the
same time, we switch using storyboard to do bugs and blueprints tracking.

For the next cycle, I think we will main focus on the following items:

- More tests about operation engine in multi node cases, improve the HA of
  scheduled operations and the capacity of tasks that one operation engine can
  hold.
- Enhance performance in the scene of calendar time formats because the feature
  maybe broken in some cases.
- Documentation about the new features.

I'm happy to welcome new contributors to Karbor project and I would be honored
to have your vote.

Thanks,
Jiao Pengju (jiaopengju)
