I am announcing my candidacy for Mistral PTL for the Stein release cycle.

If you don't know me, I am d0ugal on Freenode. I have been working full time on
OpenStack since the Icehouse release cycle in 2014. I started to contribute to
Mistral in 2016 and joined the core team later that year. Since then I have
been dedicating more of my time to the Mistral project. I am also a core in
TripleO, which relies on Mistral. I am employed by Red Hat.

I was fortunate enough to be the PTL during Rocky. I believe my biggest success
was reducing the Mistral launchpad backlog by 50% and running the Monday and
Friday "office hour" meetings, which were an informal way for the team to meet
and complete routine tasks like bug triage.

During Stein, I would like to focus on some of the following areas. We started
efforts in Rocky in some of these, and I'd like to continue that work.

* Documentation and Onboarding

  I would like to put a stronger focus on documentation, to make the Mistral
  onboarding process easier for new users, operators and contributors. Mistral
  has proven itself to be very powerful and useful but I think we need to make
  it easier and more attractive to new users. This will likely require an
  overhaul of the documentation and a stricter requirement of documentation for
  changes and additions.

* Further work on mistral-extra

  mistral-extra will provide a library of Actions that will let workflow
  authors easily integrate with more services and tools. In Queens we made good
  progress with mistral-lib, a new library for writing actions. In Stein I
  would like to see more progress with mistral-extra. The first addition is
  likely to be Ansible integration and the relocation of the OpenStack actions
  from the main Mistral repo. This work will increase Mistrals utility and
  lower the barrier to entry for new workflow authors.

* Consistency, Stability and HA

  Some components, like the event engine have been added without HA taken into
  consideration. I would like to see us resolve these and set a higher standard
  for further additions to avoid this problem returning. The cron triggers
  subsystem also doesn't meet the quality standard we should expect - enabling
  it creates high load and it requires refactoring.


These are some of my personal goals and ideas. However, I see the PTL role as
much about coordination and collaboration. This is why I believe a focus on
onboarding, documentation and stability would be best for the project. I hope
to incorporate and support ideas from other community members and help
everyone work more efficiently.

I would love to speak to more new users and contributors. You can reach out to
me directly or find me in #openstack-mistral.
