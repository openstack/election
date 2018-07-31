Fellow Barbicaneers,

I'd like to nominate myself to continue to serve as Barbican PTL
through the Stein cycle.

This is still an exciting time for Barbican.  We're seeing more
deployers using Barbican, and that trend should continue as deployers
focus more on meeting security and compliance requirements.

A castellan compatible backend has finally been prescribed as a base
service, meaning that we should start seeing more integrations
as Openstack developers start to store their secrets more securely.

In particular, for the Stein cycle, I'd like to continue the progress
made in Rocky to:

1) Grow the Barbican team of contributors and core reviewers.
2) Help drive further collaboration with other Openstack projects.
3) Help ensure that deployments are successful by keeping up on
   bugs fixes and backports.
4) Help develop new secret store plugins, in particular :
   -- making sure the vault plugin works robustly.
   -- using the PKCS#11 plugin to communicate with ATOS, Luna, Thales
      and SoftHSM.
   -- SGX and Fortanix
5) Continue the stability, maturity and usability enhancements.

Thank you in advance for this opportunity to serve.

--Ade Lee (alee)

