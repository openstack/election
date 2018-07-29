Hi all,

I'm writing this email to propose myself as Qinling PTL for Stein dev cycle.

I have been serving as Qinling PTL in Rocky, the first dev cycle for Qinling as
an official OpenStack project. Qinling is a small team for now but we did have
made significant improvements and enhancements during Rocky, e.g. support TLS
communication with k8s API server, support untrusted runtime so that Qinling
can leverage the security container technology such as Kata container and
gVisor to run untrusted functions, we also add function alias support to make
it easy to invoke the function for the function consumers. Additionally,
Qinling documentation also has improved a little bit thanks to all the
contributors.

Although there are a bunch of competitors to Qinling in serverless area
especially in k8s ecosystem, the main difference between Qinling and other
solutions is OpenStack is always the first citizen in Qinling's world, support
the integration with other OpenStack services is always our first priority. So
we won't compete with other FaaS projects and we don't care.

So speaking of Stein, I'd like to take some time to focus on the next set of
challenges to make Qinling production ready as soon as possible(it's also an
internal goal in my own team):

- Continue to work on the runtime security issue
- High availability of qinling-api and qinling-engine
- More intelligent execution scale algorithm

Besides, all other contributions to Qinling are welcomed.

Thank you all for taking a moment to read what I have to say.

Lingxian Kong
