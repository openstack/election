Hello!

I would like to announce my candidacy for the Winstackers PTL election for the
upcoming cycle.

I have been involved in OpenStack for several years, mostly working on
different projects which also involves Windows, Hyper-V, and related
technologies.

As you might know, over the past several years, we were able to work on
different projects, developing drivers, agents, plugins necessary to integrate
Windows and Hyper-V into the OpenStack environment. Most of them are using
the os-win library. Some of these are:

- Cinder Windows iSCSI and SMB drivers
- Neutron OVS Agent on Windows
- Ceilometer Polling Agent on Windows
- Manila Windows SMB Driver
- Designate Microsoft DNS Server backend support
- Kolla ansible role for Hyper-V
- involvements in other tangential projects like os-vif and os-brick

Most of the efforts go towards ensuring and maintaining the functionality of
those drivers. One goal for the near future will be to transition our CIs to
using python3, since python2 is approaching its end of life.

Recently, our focus was on the following items:

- Glance Windows support, which we need for a usecase, allowing images to be
  stored on S2D backed HA shares.
- ovsdb monitor support.
- adding log rotation options in our installers.
- general bug fixing and improvements, including python 3.6 related issues on
  Windows.
- CI maintenance.

As for the future, we plan on finishing any previously unfinished items, plus
a few othe items:

- Upstreaming some features which are currently only on compute-hyperv,
  including: Shielded VMs, Nova assisted volume snapshots.
- documentation updates. We have some all-purpose general documentation
  regarding how to set up and configure the nodes, but it doesn't fit the
  OpenStack style documentation, so it has to be adapted.

New items will be added to the list when the need arises. New goals and
suggestions are always welcome.

Thank you for your consideration,

Claudiu Belu

