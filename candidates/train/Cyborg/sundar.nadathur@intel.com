Hello Stackers,
  I'd like to announce my candidacy for PTL role of Cyborg for the Train cycle.

  Cyborg got to a rolling start in 2018 led by Howard (Zhipeng) Huang.
  Under his leadership, we established the basic infrastructure for
  sustained growth, resulting in our official release in Rocky. During the
  Stein release, with Li Liu as the PTL, we have made substantial progress,
  particularly in defining a clean database schema and device model that
  will form the basis for future work. In both cycles, we had several
  illuminating discussions with Nova developers to define how Cyborg would
  interact with Nova.

  As we move forward, there is considerable potential in Cyborg, as
  evidenced by the interest shown by cloud/telco operators around the
  world. To realize this potential and deliver real-world use cases, here
  is what we'll aim to accomplish in the Train cycle:

  * Complete the integration with Nova, so that we can launch VMs with
    accelerators attached to them.
  * Enable consumption of accelerators either as raw devices or as offloaded
    functions.
  * Support a variety of devices, by enabling Cyborg drivers for them.
  * Lay the groundwork for features, such as performance monitoring and
    health monitoring, to enable usage in production.

Thanks.
Sundar Nadathur
