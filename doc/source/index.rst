.. TODO: Update below definition for new elections
.. |Timeframe| replace:: Mitaka-Newton timeframe (September 5, 2015 00:00 UTC to September 4, 2016 23:59 UTC)
.. |PreferredEmailDeadLine| replace:: September 18, 2016
.. |Projects.yaml| replace:: http://git.openstack.org/cgit/openstack/governance/tree/reference/projects.yaml?id=sept-2016-elections
.. |TCSeats| replace:: 6

==================
OpenStack Election
==================

.. include:: events.rst

See `Election system`_, `PTL details`_ and `TC details`_.

.. Below is the official list of candidates for the current round.

.. TODO: Change from ptl.rst to tc.rst when TC rounds starts
.. .. include:: tc.rst


Previous elections
==================

.. include:: archive_toc.rst


Election Officials
==================

* Tony Breeds (tonyb), tony at bakeyournoodle dot com
* Tristan Cacqueray (tristanC), tdecacqu at redhat dot com
* Nate Johnston (njohnston), openstacknate at gmail dot com

For any questions, please contact officials by mail or over irc at
#openstack-dev Freenode channel.


.. _Election system:

Election System
===============

Elections will be held using CIVS and a Condorcet algorithm
(Schulze/Beatpath/CSSD variant). Any tie will be broken using
Governance_TieBreaking_.


Electorate
==========

The electorate for this election are the Foundation individual members that
are also committers for one of the `official project teams`_ repositories over
the |Timeframe|.

The electorate is requested to confirm their email address in gerrit,
review.openstack.org > Settings > Contact Information > Preferred Email,
prior to |PreferredEmailDeadLine| so that the emailed ballots are mailed
to the correct email address.

The electorate is expected to abide by the following general resolution:
https://governance.openstack.org/resolutions/20140711-election-activities.html.


Candidates
==========

Any member of an election electorate can propose their candidacy for the same
election. Nominees propose their candidacy by submitting a text file to the
openstack/election repository. See documentation below.


.. _How to submit a candidacy:

How to submit your candidacy
============================

If you are not already familiar with OpenStack development workflow, see this
more detailed documentation:
http://docs.openstack.org/infra/manual/developers.html

Candidacies now need to be submitted as a text file to the openstack/election
repository. Here are the required steps:

* Clone the election repository:
  git clone git://git.openstack.org/openstack/election ; cd election
* Create a new file candidates/newton/<project_name>/<irc_name>.txt
  containing your candidate statement.
* Commit your candidacy: git add candidates/newton/*/*.txt;
  git commit -m "Adding <your_name> candidacy for <project_name>"
* Submit your candidacy: git review

For example if John Doe (jdoe on IRC) wants to become the Newton Nova PTL,
he needs to write his candidacy to "candidates/newton/Nova/jdoe.txt"

After it's submitted to gerrit, verification and approval is being done by
elections officials. Then the approved candidate list above is updated.


.. _PTL details:

Project Team Leads' election
============================

Elected Positions
-----------------

Every `official project teams`_ must elect a PTL. PTLs are elected for 6 months.
Reference: |Projects.yaml|.


Electorate
----------

Except otherwise-noted in the project team description, the electorate for a
given PTL election are the Foundation individual members that are also
committers for one of the team's repositories over the |Timeframe|.


.. _TC details:

Technical Committee's election
==============================

Elected Positions
-----------------

Under the rules of the `TC charter`_, we need to renew |TCSeats| TC seats for
this election. Seats are valid for one-year terms.

* Technical Committee member - |TCSeats| positions.


Electorate
----------

The electorate for this election are the Foundation individual members that
are also committers for one of the `official project teams`_ repositories over
the |Timeframe|.


Candidates
----------

Any individual member of the foundation can propose their candidacy
(except the last TC members who were elected at the previous election).

Nominees proposes their candidacy by submitting a text file to the
openstack/election repository. The file must be placed in
candidates/<cycle>/TC/<candidate_irc_name>.txt.
The candidacy is then confirmed by elections officials through gerrit vote.
See above `How to submit a candidacy`_ documentation.


.. seealso::

  See the `Election Officiating Guidelines`_ page in the wiki for details on the
  election process.

.. _Election Officiating Guidelines: https://wiki.openstack.org/wiki/Election_Officiating_Guidelines
.. _Governance_TieBreaking: https://wiki.openstack.org/wiki/Governance/TieBreaking
.. _TC charter: https://governance.openstack.org/reference/charter.html
.. _official project teams: https://governance.openstack.org/reference/projects/index.html
