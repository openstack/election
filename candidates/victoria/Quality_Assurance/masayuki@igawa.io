Hi everyone,

I'd like to announce my candidacy as the PTL for the Quality Assurance PTL
role for the Victoria cycle. First off, I would like to thank you all the
contributors, core reviewers, PTLs, and anyone who involves and makes the
OpenStack better.

Let me introduce myself briefly. I have joined the OpenStack community since
2012 as a developer. Now, I'm a core member of some QA projects such as
Tempest, os-testr, OpenStack-health, stackviz, coverage2sql, subunit2sql[1].
And I also played the mentors/instructors role at the upstream training in
Japan several times. It was a great experience to know how difficult of
telling people how OpenStack community is going.

In the Ussuri cycle, we've almost completed "Drop Python 2.7 Support"[2]
which is one of the Ussuri goals. We also have been trying to keep the gate
stable which is the mission of the team. And we approved one interesting
spec - "Whitebox Tempest Plugin"[3] which is one of the tempest plugins.
It can access controller nodes and/or compute nodes such as read and write
INI files, restart services, examine the database, etc. Tempest does not cover
this feature because it isn't the scope. However, it is necessary to expand
automated testing.

We still have a few more planned work pending for Ussuri, such as removing/
migrating the .testr.conf to .stestr.conf, RBAC testing, removing tempest
plugin sanity BLACKLIST, adding new glance tests, improving Tempest cleanup,
etc. But I think we will be able to accomplish them in the Ussuri cycle as we
still have around one month for Ussuri release.

Along with daily QA activities, my priorities for QA for the next cycle will
be:

 * New ideas for more tooling and/or tests project to focus on OpenStack or
   common communities. (whitebox tempest plugin, for example)

 * Stability of Tempest plugins. The sanity job is already voting, and there
   are 57 tempest plugins[4], but 12 plugins are in the blacklist. Some of the
   plugins are deprecated already, but it's hard to know from the registry
   page. It needs to be classified, and the page can be improved.

 * Guiding and motivating more contributors to QA projects, improving
   documentation, and advertising OpenStack QA projects.

 * Completing Ussuri priority items if it's still lasting.

It's hard to accomplish without our collaboration. So, let's do it together!


[1] http://stackalytics.com/?user_id=igawa
[2] https://governance.openstack.org/tc/goals/selected/ussuri/drop-py27.html
[3] https://specs.openstack.org/openstack/qa-specs/specs/other/whitebox-tempest-plugin.html
[4] https://docs.openstack.org/tempest/latest/plugin-registry.html#detected-plugins

Thanks for your consideration!
-- Masayuki Igawa (masayukig)
