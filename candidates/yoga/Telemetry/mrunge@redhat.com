Hi,

with this, I'm throwing my hat a third time into the ring to serve
as Telemetry PTL.

During the last cycle, we deprecated Panko from the Telemetry stack,
there will be no more panko releases for newer OpenStack versions.

If someone is following one of the many OpenStack autoscaling examples,
they will probably run into the issue that cpu_util is mentioned as the
metric to watch. It has been removed a long time ago, but folks are
still running into this and it may make sense to just add it back.

Depending on community interest, I am planning to organize PTG sessions
like we did last April.

Thank you for your support and your consideration,
Matthias
