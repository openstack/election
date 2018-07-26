Hey everyone,

I'm writing to submit my self-nomination as keystone's PTL for the Stein
release.

We've made significant progress tackling some of the major goals we set for
keystone in Pike. Now that we're getting close to wrapping up some of those
initiatives, I'd like to continue advocating for enhanced RBAC and unified
limits. I think we can do this specifically by using them in keystone, where
applicable, and finalize them in Stein.

While a lot of the work we tackled in Rocky was transparent to users, it paved
the way for us to make strides in other areas. We focused on refactoring large
chunks of code in order to reduce technical debt and traded some hand-built
solutions in favor of well-known frameworks. In my opinion, these are major
accomplishments that drastically simplified keystone. Because of this, it'll be
easier to implement new features we originally slated for this release. We
also took time to smooth out usability issues with unified limits and
implemented support across clients and libraries. This is going to help
services consume keystone's unified limits implementation early next release.

Additionally, I'd like to take some time in Stein to focus on the next set of
challenges and where we'd like to take keystone in the future. One area that we
haven't really had the bandwidth to focus on is federation. From Juno to Ocata
there was a consistent development focus on supporting federated deployments,
resulting in a steady stream of features or improvements. Conversely, I think
having a break from constant development will help us approach it with a fresh
perspective. In my opinion, federation improvements are a timely thing to work
on given the use-cases that have been cropping up in recent summits and PTGs.
Ideally, I think it would great to come up with an actionable plan for making
federation easier to use and a first-class tested citizen of keystone.

Finally, I'll continue to place utmost importance on assisting other services
in how they consume and leverage the work we do.

Thanks for taking a moment to read what I have to say and I look forward to
catching up in Denver.

Lance
