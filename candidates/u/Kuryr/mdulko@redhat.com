Hello,

I'm writing this to announce my candidacy for Kuryr Project Team Lead in the U
cycle.

As you probably already know Daniel Mellado was unable to continue serving as
the PTL for Kuryr in the middle of Train cycle. I was nominated to take the
role for the rest of the cycle and would like to continue during the U
timeframe.

I see following goals for the Kuryr project during the U timeframe:

* Stabilization of kuryr-kubernetes:
  * Codebase had grown extensively, we need to take a step back and address
    technical debt we created.
  * Improve functional testing of new features.
  * Work on kuryr-controller's stability.
* Clarifying situation of kuryr and kuryr-libnetwork:
  * As there was virtually no contribution besides housekeeping on the
    openstack/kuryr project, we should consider extracting the kuryr.lib and
    retiring the project.
  * kuryr-libnetwork situation is a bit different as it's used by Zun and
    contribution statistics during Train cycle look a bit better. Anyway
    clarifying the way forward would be a good thing to do in U cycle.

Thanks,
Michał Dulko (dulek)
