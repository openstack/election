I'd like to announce my candidacy for Swift PTL for the Wallaby cycle.

This past year, Swift celebrated ten years running in production. Much
has changed in that time: new features have been developed and polished,
versions of Python have come and gone, and clusters have grown to
staggering capacities. However, our commitment to operational excellence
remains the same.

Recently (particularly in the last several months), I've noticed our
contributors increasingly have an operator's mindset. We look for more
and better ways to measure Swift. We seek to reduce client impacts from
config reloads and upgrades. We take greater ownership over the health
and performance of our clusters. To a large extent, we're all operators
now.

The benefits have been enormous. We've improved performance; we've
upgraded without disrupting any client requests; we've migrated clusters
to Python 3 to position them well for the next ten years. Through it
all, clients put ever more data into Swift.

The increases in demand bring almost incomprehensible scales. We now see
individual clusters sustaining tens of thousands of requests every
second. We see containers with a billion objects. We see expansions that
are as large as many whole clusters were just a few years ago.

This is our next great challenge: how do we move away from a world where
expansions are a rarity that may require a bit of a scramble and into a
world of constant expansion? How can we effectively manage clusters with
thousands of nodes? How do we shift from thinking in terms of petabytes
to exabytes? I can't wait to see how we rise to meet this challenge.
