Hi everyone,

I would like to announce my candidacy for horizon PTL.

I have been involved with various OpenStack projects including neutron and
user-facing projects for long years since Folsom. I have been a core reviewer
of horizon since Grizzly. I participated horizon development very actively on
not only horizon internals but also interactions with various back-end services.
I has an experience on operating OpenStack private clouds for years.
I believe my experience helps me being an effective PTL for horizon.

During the Ussuri cycle, I see the following as prioritized topics:

* Django 2.2 support: Most distributions are migrating to Django 2.2
  and horizon and plugins need to support it. We need to support Django 2.2
  not only in the main horizon repository but also in horizon plugins.
  We will help the effort in horizon plugins as well.
* Closing feature gaps between CLI and horizon: horizon lacks many features
  implemented in back-end services. I would like to explore how we can
  improve this situation through communications with project teams.
* Triaging bugs more actively. Bug deputy might help us as the neutron team does.
* Finally, but important, I am happy to help contributors to land their
  contributions. We are a really small team, so new and/or non-regular
  contributors are really important for us.

I'm looking forward to working together with all of you on Ussuri release.

Thank you,
Akihiro Motoki (irc: amotoki)
