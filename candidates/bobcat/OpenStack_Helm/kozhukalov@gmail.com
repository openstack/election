Dear openstack-helmers,

I'd like to announce my candidacy to be Openstack-helm PTL for the Bobcat cycle.

I believe I can be a good candidate. Let me explain why.

I am a Principal Devops Engineer at Mirantis and I have been actively working with cloud
technologies since 2012. So I am not new here. Moreover I am happy to have an experience of
having been on both sides of the barricades: deployment and usage of various cloud configurations.

From 2012 till 2017 I was closely involved in development of one of the most popular
Openstack deployment tools - Fuel, and I was Fuel PTL during Newton release cycle.
So even PTL role is not new for me.

Since 2017 I've been an active Openstack and Kubernetes user in different projects including
fintech and telecom industries.

We at Mirantis are using Openstack-helm in two large downstream projects and are very interested
in keeping the Openstack-helm light on. Many of our engineers have decent expertise and as a Mirantis
employee I am in constant contact with them.

Openstack-helm hasn't been under very active development recently but still it is
a very important part of the Openstack ecosystem. I believe we can continue to improve it
to help those individuals and companies that want to benefit from using openstack-helm.

What we can do is to make it even more user friendly which means the following:

1) Improve the documentation
2) Resolve/respond to existing Storyboard requests and try to react quickly to the new ones
3) Support newer OS distributions (Ubuntu Focal, Fedora 36, Centos Stream)
4) Support newer Openstack releases (Yoga, Zed)

Thanks for reading. If you like the plan, please vote.
