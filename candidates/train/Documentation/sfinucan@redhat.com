Hey,

I'd like to announce my candidacy for Docs PTL for the Train cycle.

I've been involved in the documentation project since the heady days of
2016, back when the documentation team centrally managed the user-facing
docs of every core OpenStack project. My initial contributions mostly
focused on correcting and expanding the documentation related to my
primary focus area in OpenStack, NFV enablement, though this slowly
expanded as I built up competence in all things docs. At some point, for
many disparate reasons, *os-manuals-migration* happened [1]_, and each
project began taking responsbility for their own documentation. I
assisted with the migration of the nova docs in particular and have been
continuously involved ever since.

As a result of *os-manuals-migration*, today's documentation team is
mainly intended to act as a liason to other teams, stepping in to help
with various documentation-related questions and, where necessary,
providing additional tooling. In my opinion, this is both a pragmatic
and a sustainable approach and I would like to see the documentation
project continue on this trajectory, changing course only if/when
necessary. As such, my focus areas for the upcoming cycle would be
continued work on making documentation easier to contribute to (or
unnecessary, where docs can be generated from code), cleaning up the
remaining warts in the existing documentation and documentation
processes, and generally ensuring the documentation team is as helpful
as possible for the projects that need us. I feel I am well equipped to
handle this, and I hope you do too.

Cheers,

Stephen (stephenfin)

.. [1] https://specs.openstack.org/openstack/docs-specs/specs/pike/os-manuals-migration.html
