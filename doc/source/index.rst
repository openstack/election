.. include:: configuration.rst

==================
OpenStack Election
==================

.. toctree::
   :hidden:

   process

.. include:: events.rst

See `Election system`_, `PTL details`_ and `TC details`_.

.. Below is the official list of candidates for the current round.
.. candidates::


Previous elections
==================

.. include:: archive_toc.rst


Election Officials
==================

Officials in OpenStack technical elections are delegates of the OpenStack
Technical Committee, and follow a mostly automated :doc:`process` assisted by
continuous integration jobs. The TC is always looking for volunteers interested
in officiating future elections, so reach out to them if you would like to
help.


.. note::

    Election officials should not run for election themselves. They must
    also maintain strict neutrality in reviewing election candidates, when
    setting up elections and in handling their results.

Our current election officials are:

* Ian Y. Choi (ianychoi), ianyrchoi at gmail dot com
* Slawek Kaplonski (slaweq), skaplons at redhat dot com

For any questions, please contact officials by mail or over irc at
#openstack-dev OFTC channel.

TC liaison
==========

The TC liaison is a current TC member who is not running for re-election
and will serve as the primary point of contact for the election officials.
The TC liaison is responsible for ensuring that elections are conducted on
schedule and that there are enough election officials available to manage
the election. If necessary, the liaison can add or remove election officials
from the Gerrit ACL group.

Current TC Liaison:

* Goutham Pacha Ravi (gouthamr), gouthampravi at gmail dot com

.. _Election system:

Election System
===============

Elections will be held using CIVS and a Condorcet algorithm
(Schulze/Beatpath/CSSD variant). Any tie will be broken using
Governance_TieBreaking_.


Electorate
==========

The electorate for this election are the Foundation individual members that
are also `contributors`_ to one of the `official project teams`_ repositories over
the |Timeframe| or have been conferred `contributor status by the TC`_

The electorate is requested to confirm their email address in gerrit,
review.opendev.org > Settings > Contact Information > Preferred Email,
prior to |PreferredEmailDeadLine| so that the emailed ballots are mailed
to the correct email address.

As the CIVS elections are private you will need to allow this email address to
receive emails from CIVS.  You can do this at: https://civs1.civs.us/cgi-bin/opt_in.pl

The electorate is expected to abide by the following general resolution:
https://governance.openstack.org/resolutions/20140711-election-activities.html.


Candidates
==========

Any member of an election electorate can propose their candidacy for the same
election. Nominees propose their candidacy by submitting a text file to the
openstack/election repository. See documentation below.


.. _How to submit a candidacy:

How to submit a candidacy
=========================

Each candidate must nominate themselves for each elected position, and are
encouraged to submit their own candidacy to gerrit, although where
appropriate, others may submit a candidacy for those who have already
self-nominated by other means.

If you are not already familiar with OpenStack development workflow, see this
more detailed documentation:
https://docs.openstack.org/infra/manual/developers.html

Candidacies now need to be submitted as a text file to the openstack/election
repository. Here are the required steps:

* Clone the election repository::

   git clone https://opendev.org/openstack/election ; cd election

* Create a new file candidates/<cycle>/<project_name>/<email_address>
  containing the candidate statement.
* Commit the candidacy::

   git add candidates/<cycle>/*/*
   git commit -m "Adding <your_name> candidacy for <project_name>"

* Submit your candidacy::

   git review

For example Dana Developer (ddev on IRC) would compose a platform in a file
named "candidates/newton/Nova/dana\@inconnu.org" to submit a Newton Nova PTL
candidacy.  The election webpage will display the candidacy as
"Dana Developer (ddev)" based on the IRC nick stored in Dana's foundation
member profile.

After the candidacy is submitted to gerrit, verification and approval will
be performed by elections officials, followed by an update to the approved
candidate list.


.. _PTL details:

Project Team Leads' election
============================

Elected Positions
-----------------

Every `official project team`__ must elect a
`PTL <https://docs.openstack.org/project-team-guide/ptl.html>`_.
PTLs are elected for 6 months.
Reference: |Projects.yaml|.

__ `official project teams`_

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

Nominees proposes their candidacy by submitting a text file to the
openstack/election repository. The file must be placed in
candidates/<cycle>/TC/<email_address>
The candidacy is then confirmed by elections officials through gerrit.
See above `How to submit a candidacy`_ documentation.


.. seealso::

  See the `Election Officiating Guidelines`_ page in the wiki for details on the
  election process.

.. _Election Officiating Guidelines: https://wiki.openstack.org/wiki/Election_Officiating_Guidelines
.. _Governance_TieBreaking: https://wiki.openstack.org/wiki/Governance/TieBreaking
.. _TC charter: https://governance.openstack.org/reference/charter.html
.. _official project teams: https://governance.openstack.org/reference/projects/index.html
.. _contributors: https://governance.openstack.org/tc/reference/charter.html#voters-for-ptl-seats-apc
.. _contributor status by the TC: https://governance.openstack.org/tc/reference/charter.html#voters-for-tc-seats-ac
