Hi all,

I would like to announce my candidacy to continue as Vitrage PTL for the Train
release.

I’ve been the PTL of Vitrage since the day it started and I'll be happy to
continue leading it in the next six months.

I think we've had a very successful Stein cycle. Our main features include:

* New and simplified template language
* Improved resource query APIs
* New service list API
* Integrations with more openstack components (Trove, Zaqar, Monasca)
* More flexible configuration for the Prometheus datasource

Moving forward, these are the areas that I believe we should focus on:

* Continue the cross-project work that we started in Stein. Some of our plans
  relate to the self-healing SIG effort: finish the integration with Monasca,
  allow configuring Vitrage via Heat templates for auto-healing scenarios, and
  in general integrate with more datasources - both OpenStack and external.

* Extend the Vitrage support for Kubernetes. In addition to performing root
  cause analysis over Kubernetes nodes, we would like to consider also Helm
  charts, Kubernetes deployments, and optionally pods.

* Improve the Vitrage UI, hopefully using a new React-based plugin.

* Extend the Vitrage community. I'll be happy to see more contributors joining
  our effort.

I look forward to working with you all in the coming cycle.

Thanks,
Ifat.
