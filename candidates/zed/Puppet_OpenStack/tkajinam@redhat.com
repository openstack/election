Hello,


I'd like to announce my candidacy for the PTL role in Puppet OpenStack, for
the Z release cycle.

I've been involved in the project for a few years. I joined the core reviers of
the project in 2020. My contribution started with adding a few parameters but
nowdays I'm covering literally all modules to keep these modules consistent
with the latest service implementation, as well as helping release management.

I'll list up some important items for the upcoming Z-release, which I'd like
to prioritize.

 - Keep our implementation up to date and clean up old items to keep codes
   as much simple as possible.

 - Extend support for Secure RBAC. We are adding partial support to enforce
   Secure RBAC in Keystone durign Yoga.

 - Stabilize support for CentOS 9 Stream, which we are adding for Yoga.

 - Add support for the new Ubuntu LTS.

 - Improve scenario/component coverage by CI.

Finally, as we are currently a small team, we always welcome new contributors,
reviewers or whoever interested in helping the project !

Thank you for your consideration.

Thank you,
Takashi
