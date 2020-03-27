I'd like to announce my candidacy for OpenStack Ansible PTL.

As usual, I want to go over all the points I talked about last
time and their progress.

# Simplifying scenarios for usage and testing
We probably haven't progressed much in this, our testing has improved,
we did add upgrade testing but unfortuantely that hasn't been as stable.

# Using integrated repository for testing and dropping role tests
This is pretty much done for the expect of a few corner projects.

# Progress on switching all deployments to use Python3
This is also done with some packaging workarounds to make it work with
CentOS 7.

# Eventual addition of CentOS 8 option
We made some progress in this, but it still needs a lot more work,
big thanks to jrosser for driving a bunch of this work too.

# Reduction in number of config variables (encouraging overrides)
This has been done over a few roles now that are using overrides in
hopes of minimizing the number of variables to speed up runs.

# Increase cooperation with other deployment projects (i.e. TripleO)
The Ansible SIG is moving and alive, TripleO uses python_venv_build and
os_tempest as well as our connection plugins, so yay.

We've worked on getting some new cores as well and making sure the
project continues to be sustainable.

Thank you for your consideration.
