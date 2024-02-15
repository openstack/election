Hello Everyone,

Here is my candidacy letter to continue as a PTL for OpenStack-Helm for 2024.2 release.

Let me first remind you what we've managed to achieve during 2024.1:

- OVN is now considered as working well and recommended as the default netowking backend.
  We now have 2023.2 compute-kit test job with OVN and it worth to have such test job for future releases.

- We switched all our test jobs to the upstream Ingress-Nginx Helm chart and now it is a recommended
  way to deploy the ingress controller. Users can utilize other ingress controller implementations if they need.

- The mariadb-cluster chart was introduced. It utilizes the Mariadb-Operator for managing Mariadb
  clusters. At the same time the HA part of the Openstack-Helm mariadb chart was also improved.

- For about a half of test jobs we now utilize the Rook operator for managing Ceph clusters. The ceph-adapter-rook
  chart was introduced which allows users to deploy Ceph either by means of using Openstack-Helm ceph-* charts
  or Rook operator.

- The deployment documentation was updated.

- The DPDK test jobs was revived.

- Support of Ceph RBD as a backend for ephemeral VM disks was added.

- The Ansible role for deploying test jobs enviroment was improved. Now we can run all the test jobs on either
  single-node or multi-node environments. This is important to be able to utilize multiple small nodes for CI instead
  of one huge node.

There are also some activities that are currently in progress:

- The OpenStack deployment with Metallb.

- Using uWSGI for API services.

I would like to say thank you so much to all our contributors and I am very pleased to be a part of the team.

We still have a lot to do:

- Let's simplify the Openstack-Helm code base even further and use third party Helm charts wherever possible
  and keep focusing more on Openstack charts.

- Many of our users struggle to deploy the production ready Openstack clusters. This means we need to continue
  imporving the user documentation. We probably can give some examples of how users can manage their passwords,
  how they can monitor their clusters and integrate their clusters with their CI/CD tools.

I would like to continue serving as a PTL of the Openstack-Helm and do my best to improve the project.

Thank you,
Vladimir Kozhukalov
kozhukalov@gmail.com
