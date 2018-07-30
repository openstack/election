Hi everyone:

I would like to submit my candidacy to become PTL for the OpenStack Ansible
project for the upcoming Stein cycle.

I have been personally involved in the deployment of OpenStack for many years
now, using all sorts of different deployment tools.  Ansible seems like a
great choice for deployment OpenStack and I've been using OpenStack Ansible
for quite a while now.

As PTL, I hope that I can work with the team to focus on the following:

# CI
- Improve stability of CI for both roles and integrated repo. by using more
  mirrors.
- Start leveraging the integrated repo playbooks inside the role test jobs in
  order to avoid the duplication and test the OpenStack Ansible path
- Once jobs are stable, add integrated jobs to all roles in order to be sure
  that we don't break the integrated repo with role changes.

# Deployment
- Continue to work and finalize the addition of distro installation for all
  distributions.
- Aim to start integrating the `systemd` roles and look into seeing the
  possibility of enabling nspawn and avoiding lxc on CentOS.

There's much more to be done, but those are some of the aspects that would
help in the stability of this project which is what I feel we need to focus
a bit more on.   As a deployment project with a limited scope of the operating
systems needing to exist, there doesn't seem to be much we can come up with
and taking a cycle just to catch up on all the debt, improve stability and
make the maintenance of the project easier is extremely useful.

I hope to work with the team for the upcoming cycle.

Regards,
Mohammed
