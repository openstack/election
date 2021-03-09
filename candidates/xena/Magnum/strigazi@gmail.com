Hello OpenStack community,

I would like to continue serving as Magnum PTL.

In wallaby we mostly maintained and updated our templates for kubernetes
and related addons along with the CI maintenance.

In this release, our focus continues to be making the cloud operators
easier with:
* control-plane on operators tenant
* performance improvements for API calls
* cluster node replacement
* finish transition to helm3 for addons

See you in gerrit,
Spyros Trigazis
