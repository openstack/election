Hello,

I would like to announce my candidacy to be Manila PTL over the 2025.2
(Flamingo) cycle. I have been working with these amazing
contributors and community members for many cycles.

If elected, this will be my 6th cycle as a PTL. We shared a lot of
accomplishments and faced lots of challenges together. We have continuously
been delivering features, fixes, and enhancements requested by operators. We
are making solid progress on enhancing the review bandwidth by actively adding
more people to the core team and promoting engaging activities around reviews,
to get more traction. We have also been closing the gap on the Manila UI
features, implementing OpenAPI schemas, integrating manila with OpenStack SDK
and enhancing our documentation. For the next cycle, I would like to continue
what we have been doing, but also focus on:

* Tech debt: continue the efforts to get parity between Manila APIs
and Manila UI, complete the rootwrap->privsep migration.

* Eventlet: python-manilaclient is successfully migrated, and we will continue
the process for all other manila repositories.

* Ensuring we are making progress on the integration Barbican and the
implementation of share encryption.

* Work with the contributors to ensure we have healthy testing jobs for first
party CI drivers.

Thank you for your consideration.

Carlos da Silva
IRC: carloss
