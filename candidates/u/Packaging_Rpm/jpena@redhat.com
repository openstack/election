Hello everyone,

I would like to announce my candidacy to be the PTL for the Packaging Rpm
project during the Ussuri development cycle.

For the Ussuri cycle, my focus would be on:

* Making sure all packages have been migrated to Python 3, so we can finally
  get rid of Python 2.

* Transition the RDO CI and packages to CentOS 8, once it is released, and
  remove the now obsolete Fedora-based CI.

That, of course, would be in addition to our common goals: expanding our
contributor base, improving collaboration between RPM distributions, and
keeping a high quality set of packages.

Thanks,
Javier

