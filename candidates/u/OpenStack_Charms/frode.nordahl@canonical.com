Hello all,

I would like to announce my candidacy as PTL for the OpenStack Charms
project for the Ussuri cycle.

The project has made great progress in the Train cycle under James's
capable leadership.

Some examples are; further Python3 stabilization and Python2 dependency
removal, multi-model support was implemented in the Zaza functional test
framework, improvements were made to SSH host key handling for our charmed
deployment of Nova, Neutron DVR support was improved, actions to help handle
cold start of a Percona Cluster and a tool for retrofitting existing cloud
images for use as Octavia Amphora was implemented. We also provided preview
charmed support for Masakari.

For the Ussuri cycle we look to further improve existing features as well as
implement new charm features and new charms.

Over several cycles we have developed a good framework for our reactive charm
development of OpenStack related charms.  This framework has also been adopted
for use by non-OpenStack components.  I think it is worth taking some time to
analyze which building blocks attract non-OpenStack components, and perhaps
move the generally applicable parts of the framework down a layer to make it
available for general consumption.  In the spirit of Open Development this will
provide us with benefits we can reap for OpenStack in the long term.

Cheers,

Frode Nordahl
