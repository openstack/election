Hi all,

I'd like to nominate my candidacy for Tacker PTL for 2025.1 cycle.

I've contributed to Tacker as a PTL since victoria release. In 2024.2
cycle, we've continue to improve Tacker aiming to management
containers required for vRAN usecases such as advanced monitoring for
large amount of vRAN apps, the latest container
networking for performance or descriptor for container.

In the next cycle, we'll more focus on not only on development of
vRAN support but also improvement of maintainability of Tacker.
The amount of Tacker's code is getting increased as we've introduced
ETSI standards features step by step in the latest releases. As a
result, the complexity is also increased and it's hard to make
changes for adding a new feature, fixing bugs or so. The increase of
test codes is also problem for the maintainability, for example,
because it takes much times more than we expected and ended up with
a timeout error sometimes in functional tests.

Regards,
Yasufumi (yasufum)
