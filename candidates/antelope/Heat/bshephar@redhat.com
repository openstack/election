Hi,

I am proposing my candidacy for Heat PTL during the Antelope cycle.

I have worked with the Heat project for several years both as a user and more
recently over the last 2 years as a contributor. I see great potential in the
project for our users and look forward to continuing work in order to 
support features and functionality of the project.

Some of my objectives for the next few cycles are:


Remove the dependencies on legacy python-*client libraries and instead
shift to the openstacksdk client library.

While the legacy libraries have served us well, they are starting to
show their limitations and the delta in servicibilty will only increase
as each project moves towards leveraging the openstacksdk. So this change,
while quite extensive will ensure future compatibility with the other
OpenStack project teams.


Continue ensuring Heat supports the most up-to-date and recent features
provided by each project.

To ensure Heat is the default and best choice for our users, we need to
ensure we are able to leverage the latest available features from the
complimentary OpenStack projects. This is an ongoing challenge to stay
up-to-date with the changes each cycle and work towards implementing them
in Heat.

Thank you all for you consideration, and I look forward to the next cycle
and continuing to work with you all.

Brendan
