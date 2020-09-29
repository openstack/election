Hi there,

I'd like to announce my candidacy to become the next
PTL for OpenStack Telemetry for the Wallaby cycle.

In the past cycles, we have seen a decrease in
contribution for Telemetry related projects. We
have also seen the lengthy discussion around
gnocchi or the lack of a TSDB in OpenStack.

A few months ago, I joined the project and
helped with reviews and bug fixes. For the
next cycle, I would like to address the a few
short term but also some longer term issues
such as:

- finish cleaning up the python2 to python3
  migration.
- get a better understanding (and a solution)
  for the various telemetry gates being blocked
- recently, heat stopped testing auto-scaling
  via aodh and gnocchi, because it was too unstable.
  I'd like to address that as well.
- We haven't had a planning or a roadmap for about
  the past 1.5 cycles. That is something to do
  in the future.

Thank you for your support and your consideration.

Matthias Runge


