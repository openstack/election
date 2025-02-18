Hello,

I'd like to announce my candidacy for OpenStack Telemetry PTL for the 2025.2 cycle.
This would be my first time as PTL.

The Telemetry stack continues to be an important set of any deployed cloud, and
it continues to be adapted to integrate better with external monitoring tools.

My To-Do list:

 - Extract more metrics out of libvirt using Ceilometer Compute

 - Improve the Prometheus exporter included in the polling agent

 - Publish also events through the tcp_publisher

Thank you,
Juan
