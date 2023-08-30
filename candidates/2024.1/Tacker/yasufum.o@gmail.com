Hi,

I'd like to nominate myself for Tacker PTL for 2024.1 cycle.

I've contributed to Tacker as a PTL to provide a generic VNF Manager to industiries. We have implemented
or improved several features such as monitoring with Prometheus for containers or policy management
for multi domain usecases in addition to introduce the latest ETSI-NVF standard compliant features.
We also revised unstable unit/functional tests for which we have been suffered several times for
unexpected failures and waste of time as one of the our goals for efficiency of our development,
and documents for users to demonstrate usecases in practical examples.

In the next cycle, I'd like to continue to improving Tacker for the 5G network includes both a
radio-access network and a core network to provide operators as we've focused on.
Deploying Tacker as Service Management and Orchestration (SMO) in O-RAN architecture is one of
our plans for realizing the scenario. Tacker team has already contributed to ETSI NFV
and O-RAN SC communities while getting feedbacks from them and enforced relationship among them gradually. I'd appreciate if we make some more progress for OpenStack and these communities.

Regards,
Yasufumi (yasufum)
