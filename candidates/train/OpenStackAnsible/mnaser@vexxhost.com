I'd like to announce my candidacy for OpenStack Ansible PTL.

Over the past cycle, we've made a lot of forward progress in improving the
stability of our gate, aiming at making our roles much more linear and
improving deploy times.

There's still a lot more work to be done, and there's a lot less resources
available to get the work done with.  Therefore, I think the upcoming cycle
should be strongly focused on increasing stability, this would be done by
looking at the following

- Simplifying scenarios for usage and testing
- Using integrated repository for testing and dropping role tests
- Progress on switching all deployments to use Python3
- Eventual addition of CentOS 8 option
- Reduction in number of config variables (encouraging overrides)
- Increase cooperation with other deployment projects (i.e. TripleO)

I would like us to aim at a cycle where we stabilize things and make sure
that things chug along smoothly.  This will help reduce our overhead
and allow us to focus on the stability and robustness of the deployment
project as I believe that at this point, there's not much more 'features'
to be added in the deployment tool.

In doing this, we should hopefully drive down the time of deployment and
increase the reliability of the deployment.

Thank you for your consideration.
