I intend to continue serving as Swift PTL for the Zed cycle.

We have seen Swift scale in spectacular ways. Hard drives have grown
from 2-4 terabytes when Swift was started to 10-20T. The idea of a
"large cluster" has gone from dozens of petabytes across hundreds of
nodes to to hundreds of petabytes across thousands of nodes.

We will continue to see (and address) new challenges in scaling Swift.
We anticipate hitting the bounds of our current ring format. We see
operators struggle to balance the prioritization of cluster expansion
and data durability. We see the need to improve sharding, so that
clients are less impacted by what's going on in the backend. All of
these have seen progress in the last cycle, and will continue to be
advanced in the next.

Just as important as scaling the core storage platform, however, is
building up the ecosystem of ancillary services that users have come
to expect out of their object storage. When a container grows to have
billions of objects, it is impractical to perform thousands of listing
requests to analyze its contents; instead, users expect a periodic
inventory that's easy to pull into their existing data pipelines.
Users should be able to examine their own access logs rather than
needing to involve operators. Users want to manage their data movement
and retention en masse rather than object-by-object.

I look forward to seeing the balance we strike between enhancing the
core storage platform and building out the data services surrounding
it over the coming years.

Tim Burke
