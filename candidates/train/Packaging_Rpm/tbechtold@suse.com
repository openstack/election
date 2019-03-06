I announce my candidacy for the PTL of the Packaging RPM project.

I have been a contributor to various OpenStack projects since Havana and I'm
one of the initial cores of the packaging RPM project. The project goal is
to produce a production-ready set of OpenStack packages for RPM-based systems
(like SLES, RHEL, openSUSE, Fedora, etc.).

As a PTL, I would focus on:

- python3 support. There are still projects without python3 packages.
  Distros are moving to python3 as default so providing python3 packages
  (starting with the libs and clients) should be done now.

Thanks,
Tom
irc: toabctl
