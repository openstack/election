I'd like to announce my candidacy for OpenStack Ansible PTL.

Since my last time as PTL, I mentioned the hopes of doing a few things
during the cycle:

# Simplifying scenarios for usage and testing
We made some really good progress on this but I think our testing has
improved (see below) but there's still a big wall to climb to reach
a production environment.

# Using integrated repository for testing and dropping role tests
This effort has been largely completed.  I'm very happy of the results
and I'm hoping to drop the tests/ folder once we figure out the linting
stuff.

# Progress on switching all deployments to use Python3
This is pretty much blocked and waiting until CentOS 8 is out so we can
make an all EL8 release.

# Eventual addition of CentOS 8 option
The lack of availability has impared this :(

# Reduction in number of config variables (encouraging overrides)
We slowly started to do this for a few roles but it seems like this is
a very long term thing.

# Increase cooperation with other deployment projects (i.e. TripleO)
This has started to happen over a few roles and the newly formed Ansible
SIG which should encompass a lot of the work.

I would like us to be able to continue to catch up on our technical debt
as I think at this point, OSA is pretty much feature complete for the most
part so it's about doing things that make the maintainership easy moving
onwards.

I would also like to start dropping some of the old releases that still
have open branches.  We don't have anyone that works on them at the moment
and it's better to end them than leave them stale.

Thank you for your consideration.
