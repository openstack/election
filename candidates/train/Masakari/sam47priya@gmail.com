Hello everyone,

I’m Sampath Priyankara. I would like to announce my candidacy to
continue as PTL of Masakari for the  Train development cycle. In
Stein, we mainly focused on adding masakari-status upgrade check,
added new microversion 1.1 for masakari API, devstack support,
and functional tests for masakri. In masakari API 1.1, operator
can obtain the recovery workflow details of notifications. All
Masakari supported APIs are now available in OSC. Therefore, we
deprecate masakari CLI.
	      
For Train, I would like to continue to focus on:
- Complete Masakari Dashboard (Horizon plugin for Masakari)
- Continue to work with OpenStack HA team to develop OpenStack
  resource agents as an alternative for masakari-monitors.
- Monitoring method for volume boot Ironc instances
- Support proactive HA features
  
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
