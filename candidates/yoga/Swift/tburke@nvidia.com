It would be my pleasure to continue serving as Swift PTL for the Yoga cycle.

This past cycle, we have continued our commitment to operational excellence.
We've improved several features vital to large clusters, such as container
sharding, partition power increases, and storage-policy reconciliation. We've 
improved the durability of erasure-coded data immediately after a write. We've
made our logs, metrics, and errors more useful.

We focus on operators for several reasons. Operators are at the junction of the 
software we write, the hardware we use, and the clients we serve. They have
perhaps the best perspective to see the value-to-effort ratio of prospective
improvements. They run the experiments that establish and optimize deployment
patterns. They manage the drives and networking that allow us to serve hundreds
of petabytes at terabits per second, and their projections tell us that storage
must become bigger and faster.

Thinking like an operator, there are several areas where Swift should improve.
Replication and reconstruction continue to be a delicate balancing act between
moving data for the sake of expansion vs. ensuring durability. We need a better
handle on which data gets accessed, how frequently, and with what sort of
performance -- ideally indexed by tenant and even user. As more clusters are 
stood up in more regions, we need to improve monitoring and recovery such that
clusters can run with minimal human intervention.

I look forward to working with the community to bring Swift into a future of 
ever-larger and ever-more-numerous clusters.
