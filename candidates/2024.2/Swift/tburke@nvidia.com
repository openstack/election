I'm pleased to announce my candidacy for Swift PTL for the Dalmation
cycle.

As usual, we have a great many projects currently in flight:

- Supporting Python 3.12

- Adding more fine-grained metrics, while keeping it configurable to
  not break existing metrics pipelines nor overwhelm them

- Improving S3 compatibility, enabling a broader community of tools
  to work out of the box

- More operator tooling for expiring objects

- Better process management for WSGI servers

- Backend ratelimiting to improve per-node load shedding

I'm excited to see how each of these will move forward over the next
cycle.

Tim Burke
