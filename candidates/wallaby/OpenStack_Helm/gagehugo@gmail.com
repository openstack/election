Hello everyone,

I would like to nominate myself in order to continue to serve as the
OpenStack-Helm PTL for the Wallaby cycle.

Over the last cycle openstack-helm has continued to grow, with both the
addition of the loci project under the openstack-helm umbrella, as well
as the newly created openstack-helm-deployments repo, which should
provide more compatability with the Airship project.

One of the main goals I would like to pursue this cycle is to push for
more robust gating and checks for the openstack-helm project. There
has been a lot of changes the past cycle there that have helped
optimize and reduce the time it takes for the jobs to run. We can
continue to push the envelope and make the checks/gating move to
simulate more production-grade scenarios for testing every new addition
to the project.

Thank you!
- Gage
