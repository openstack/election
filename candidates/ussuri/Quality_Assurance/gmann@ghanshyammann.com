Hi Everyone,

I would like to announce my candidacy for Quality Assurance PTL role for
Ussuri cycle.

It was a great experience while serving QA PTL for the last three cycles. With
very few active contributions,  I am proud on the team to keep the QA tooling
up and maintained. Making sure no gate break and keep the OpenStack stability
as a priority.

In Train Cycle, we concentrate on a few key things like improving the gate
stability which was tried with breaking the integrate-gate project template
into project-specific template[1]. Migrating all the OpenStack CI/CD from
Xenial to Bionic etc.

We have few more planned work still pending for Train like keystone system
scope testing, making tempest plugin sanity job voting, documenting the QA
process etc but I think we will be able to make it in Train as we still
have around a month for Train release.

Along with daily QA activities, my priority for QA in the next cycle will be:

- Release Patrole stable version and find out the way to make it faster so that
it can test the API policy on project gate also.

- New ideas for more tooling or tests project to focus on OpenStack or Common
communities.

- Finish the grenade job to zuulv3 which is not yet merged.

- Stability of Tempest plugins. There are many tempest plugins which are not so
stable. We will plan audit activities for all plugins. I know using Tempest
service registry and setting service_availabilty properly is the key things to
do on the Plugins side.

- Finish the JSON strict validation for volume services. Zhufl has lot of
patches to review on this. This will be on priority to finish in the next cycle.
 
- Guiding and motivating more contributors to QA projects.

Thanks for reading and consideration my candidacy for Ussuri cycle.

[1] http://lists.openstack.org/pipermail/openstack-discuss/2019-July/007568.html

-gmann
