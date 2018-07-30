Hello everyone,

I’m Sampath Priyankara. I would like to announce my candidacy to
continue as PTL of Masakari for the Stein development cycle. In
Rocky, we mainly focused on add new features such as Recovery method
customization, Introspective Instance Monitoring, mutable
configuration, and started work on Ansible support, masakari
dashboard.

For Stein, I would like to continue to focus on:
- Ironic Bare Metal instance HA support
- Masakari integration with Mistral
- Complete OpenStack Ansible support for Masakari
- Complete Masakari Dashboard (Horizon plugin for Masakari)
- Continue to work with OpenStack HA team to develop OpenStack
  resource agents as an alternative for masakari-monitors.

 While working on above development, I think it is equally important
to focus on raising awareness and adoption of Masakari, improve
diversity of the team, and improve cross project/community
communication and support. I will make my best effort to find more
users, more reviewers and more developers for Masakari.

Finally, I would like to thank you all Masakari contributors for your
hard work over past cycles, and all OpenStack community members for
your valuable comments, opportunities, and all the help you
gave. Also, thank you for considering my candidacy.

- Sampath Priyankara (samP)
