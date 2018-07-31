Hi all,

I would like to announce my candidacy to continue as Vitrage PTL for the Stein
release.

I’ve been the PTL of Vitrage since the day it started. It has been an amazing
journey, both for Vitrage and for me personally.

During the Rocky cycle, we have significantly enhanced the stability and
usability of Vitrage and we added support for integrating Vitrage with several
other projects. We also took an active part in the self-healing SIG
discussions, as we believe Vitrage should hold an important role in every
self-healing scenario.

Among the most important tasks we did in Rocky were:

* Fast-failover of vitrage-graph
* Alarm history
* Significant performance improvements
* Kubernetes and Prometheus datasources

In Stein, I would like to continue the effort around Virage usability and
stability. In addition, we should integrate Vitrage with more projects,
to give the user maximum visibility of the state of the system.
On top of all the technical goals, I plan to continue the effort of enlarging
our community. We are always looking for new contributors!

I look forward to working with you all in the coming cycle.

Thanks,
Ifat.
