Hi everybody!

Sadly Dave steps down from the PTL of Keystone. We briefly discussed the
following steps and as a results of that I am hereby applying for Keystone PTL
position.

As some of you know I am currently on a personal mission of introducing a major
redesign of the federation support to allow modern usage scenarios and bring us
much closer to the hyperscalers. At the same time I work on the POC of
reimplementing Keystone in Rust (at least in parts as a library for federation
improvements), what in first comparisons shows 100 times better throughput per
process with roughly 20 times lower request latency.

Thanks,

Artem
