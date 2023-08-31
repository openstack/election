It would be my pleasure to continue serving as Swift PTL for the
Caracal cycle.

I forsee us grappling with several challenges over the next few cycles:

Successful clusters expand until they hit a wall, whether that's due
to budget or physical space constraints. Swift will need to adapt to
operate in more constrained environments.

Total disk capacity is not the only measure of a cluster. Network
bandwidth (both aggregate across the cluster as well as single-stream)
and requests per second drive much of the client experience. Swift will
need to be able to ration those between tenants, similar to how it can
enforce capacity quotas.

Operators are not the only ones interested in metrics and storage
insights. Users want to know what their individual access patterns
are like and how that has changed over time.

I'm excited to see how much we can achieve in Caracal.

Tim Burke
