Hello everyone,

I would like to announce my candidacy for the role of PTL of Glance for
the Antelope cycle.

I have been working closely with previous PTL, Abhishek since last cycle
and I am hoping to contribute back to the community as a PTL while following
his excellent example.

Since this is the first time I'm proposing my candidacy, I would like to
briefly introduce myself. I started contributing to OpenStack back in the
Juno release (although not very actively) and started focusing on the
TripleO & Puppet projects for Glance Deployment features and bug fixes in
the Newton release. Since then I've been actively contributing to the same.
Since Xena Cycle, I've started actively contributing to Core Glance Project,
as well in terms of some features, bug fixes etc.

This is how I want to focus for Antelope cycle,

1. Default Glance to configure multiple stores

Glance has deprecated single stores configuration since Stein cycle and will
remove the support of same in upcoming cycle.

2. Secure RBAC

In Xena we have mangaed to move all policy checks to API layer and implemented
project scope of metadef APIs. As per the revised community goal, we need to
make all policy rules set scope_types=['project'] for all project resources
that have already implemented scope as well as to have manager role support
once it's fully implemented in Keystone.

3. Bridge gap between python-glanceclient and openstackclient

The CLI support for all glance APIS is already there in GlanceClient and the
similar CLI support we need to have in OpenstackClient for the missing Glance
APIs in this upcoming cycle.

4. Community priorities

Whatever community goals put forward by TC, as a PTL of Glance project will
want to adopt these as a priority for Antelope cycle.

5. Other

As we are very short team at this moment, I would like to put some efforts
in attracting some contributors, help them to understand how Glance
functions and encourage them to contribute for Glance.

Looking at past how Abhishek, Erno and Brian has steadied the ship, I know its
a big task and with their help I will do my best not to fail the expectations.


Thank you for consideration,

Pranali Deore (pdeore)
