Hi,

I'd like to propose my candidacy for Tacker PTL in Z cycle.

I have been a PTL from Victoria and made an effort to implement the latest
ETSI-NVF standard features to enable operators to deploy their services. In Yoga
release, we are going to provide several container supports for deploying CNFs,
multi-version APIs for mixed environment of legacy and cutting edge-products
provided by several vendors and more. We also had several collaborative sessions
with ETSI NFV for accelerating each activity of standardization and deployment
of required features.

In Z release, I would like to expand our target to VNFs for network acceleration
other than proceed to implement VM/container management features which has been
introduced in the previous releases. It has became one of the key requirements
of the recent commercial use cases such as 5GC.

Best regards,
Yasufumi
