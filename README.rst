This repository contains OpenStack Elections reference documents
and tooling to run elections.

================
Election Process
================

PTL Elections
=============

Selecting Election Dates
------------------------

Things to keep in mind when selecting election dates:

* Election Dates must be as per the `TC charter <https://governance.openstack.org/tc/reference/charter.html>`_
  which is "The election is held no later than 2 weeks prior to each
  cycle final release date (on or before ‘R-2’ week)"
* At least 48 hours in between email deadline and poll start
* Consider extra-acs approval deadlines
* Allow at least a week for nomination period

``tox -evenv -- setup-election-config`` can be used to pick some possible dates that need to be
checked by the election officials and TC.  Once these dates are confirmed/merged
election officials can create a change against the `releases repo <https://opendev.org/openstack/releases>`_
to include these dates in the development schedule.  A helper tool ``tox -evenv -- update-releases-calendar``
will generate this change, but needs to be verified before publishing


Preparation
-----------

As early as possible but at least a month before election starts:

* Edit elections details (timeline, cycle timeframe):

  * ``edit configuration.yaml``

  .. note::

     ``to-be-released`` tag value is used during the election process.
     After the election is over, the tag value is updated
     for ``openstack/governance`` repository.

* Prepare new election, e.g.:

  * ``tox -evenv -- create-directories``

* Commit to update website
* Update Release Schedule

A couple of weeks before election starts:

* Send *PTL Election Season* email

  * ``tox -e venv -- template-emails election_season``


PTL Candidacy Round
-------------------

When PTL Candidacy start:

* Send *PTL Nominations Kickoff* email

  * ``tox -e venv -- template-emails nominations_kickoff``

During the PTL Candidacy round:

* Validate candidacy, e.g.:

  * ``tox -evenv -- check-all-candidacies``, or
  * ``tox -evenv -- ci-check-all-candidate-files candidates/release/project/candidates``, or
  * ``tox -evenv -- check-candidacy change_id``

* To +2 a candidate:

  * check commit link is indeed valid
  * check filename is email address
  * cursory check the candidacy statement

* To +Workflow, checks the previous +2 details, find another commits using
  ``--limit 5`` (optional)
* Check candidate list and fix badly generated names through changes to the
  ``exception.txt`` file or requesting the candidate to update their OSF member
  profile.

Once the email deadline is reached:

* Ask the TC chair to tag the governance repository
* Generate the electorate rolls.  This generates the rolls for all project
  teams even if they aren't going to hold an election.

  * ``tox -evenv -- generate-rolls``

A couple of days before the candidacy submission ends:

* Render statistics and send *Motivation call for PTL candidacy round*, e.g.:

  * ``tox -evenv -- render-statistics``

* Send *PTL Nominations Last Days* email:

  * ``tox -e venv -- template-emails nominations_last_days``

* Optionally send direct *PTL nominations Last Days* email to the members of the
  teams with no PTL candidates proposed:

  * ``tox -evenv -- template-emails nominations_direct_reminder -p
    <project_name> -o <owners_dir>``

When PTL Candidacy submission ends:

* Send *PTL Nominations End* email

  * ``tox -e venv -- template-emails end_nominations``

* When the tag is available, generate AC rolls, e.g.:

  * ``tox -evenv -- generate-rolls``
  * Compare AC rolls with at least one other election official


PTL Election Round
------------------

Before PTL Election begins:

* Send email to the mailing list or eligible electorates to opt in to
  CIVS voting system using their Gerrit email address in https://civs1.civs.us/cgi-bin/opt_in.pl

  * ``tox -e venv -- template-emails voting_optin_civs``

When PTL Election begins:

* `Create CIVS page
  <https://wiki.openstack.org/wiki/Election_Officiating_Guidelines#Running_the_election_itself>`_
* Upload rolls

  * CIVS has a maximum number of electorate emails you can upload at a time
    without crashing, limit to 500 at a time

* Send *PTL Voting Kickoff* email

  * ``tox -e venv -- template-emails voting_kickoff``

A couple of days before the PTL Election ends:

* Send *PTL Voting Last Days* email

  * ``tox -e venv -- template-emails voting_last_days``

When PTL Election ends:

* Close the election and update the results:

  * ``tox -evenv -- close-election --round ptl``
  * ``edit doc/sources/results/release/ptl.yaml`` and set election winners to ``true``
  * NOTE: We no longer need document TC-APPOINTMENT or LEADERLESS as the
    ``update-governance`` step will communicate that to the TC and the process
    in that repo will set the project leader.

* Commit the change and review the results
* Send *PTL Results* email

  * This is ``doc/source/results/release/announce_ptl.rst`` generated by
    building the docs with ``tox -e docs`` after
    ``doc/source/results/release/ptl.yaml`` has been created and updated

* Update governance repo:

  * ``tox -e venv update-governance -- --governance-repo ../governance/``


TC Elections
============

Selecting Election Dates
------------------------

Things to keep in mind when selecting election dates:

* Election Dates must be as per the `TC charter <https://governance.openstack.org/tc/reference/charter.html>`_
  which is "The election is held no earlier than 8 weeks and no later
  than 2 weeks prior to each cycle final release date (between ‘R-8’
  and ‘R-2’ week)"
* Allow for at least 48 hours between email deadline and polling beginning
* Allow at least a week for nomination and campaign periods
* TC and PTL election can be held as combined election

``setup-election-config`` can be used to pick some obvous dates that need to be
checked by the election officials and TC


Preparation
-----------

As early as possible but at least a month before election starts:

* Edit elections details (timeline, cycle timeframe):

  * ``edit configuration.yaml``

* Commit to update website
* Update Release Schedule

A couple of weeks before election starts:

* Send *TC Election Season* email

  * ``tox -e venv -- template-emails election_season``


TC Candidacy Round
------------------

When TC Candidacy starts:

* Send *TC Nominations Kickoff* email

  * ``tox -e venv -- template-emails nominations_kickoff``

During the TC Candidacy round:

* To +2 a candidate:

  * check candidate profile using https://www.openstack.org/community/members/
  * check filename is email address
  * cursory check the candidacy statement

* To +Workflow, check the previous +2 details

A couple of days before the candidacy submission ends:

* Send *TC Nominations Last Days* email

  * ``tox -e venv -- template-emails nominations_last_days``

When TC Candidacy submission ends:

* Send *TC End Nominations* email

  * ``tox -e venv -- template-emails end_nominations``

Once the email deadline is reached:

* Ask the TC chair to tag the governance repository
* Generate the electorate rolls.

  * ``tox -evenv -- generate-rolls``


TC Campaigning
--------------

The TC election includes a period after the candidates are defined but before
the election, for candidates to answer questions from the community.  Open this
with:

* ``tox -e venv -- template-emails campaigning_kickoff``

TC Election Round
-----------------

Before TC Election begins:

* Send email to the mailing list to opt in to CIVS voting system using their
  Gerrit email address in https://civs1.civs.us/cgi-bin/opt_in.pl

  * ``tox -e venv -- template-emails voting_optin_civs``

* Create CIVS page

  * Title the poll: $RELEASE Technical Committee Election Poll
  * Enable detailed ballot reporting
  * Send to other officials to verify

     * Check number of seats
     * Check closing date

When TC Election begins:

* Upload rolls

  * CIVS has a maximum number of electorate emails you can upload at a time
    without crashing, limit to 500 at a time* Send *TC Voting Kickoff* email

  * ``tox -e venv -- template-emails voting_kickoff``

A couple of days before the TC Election ends:

* Send *TC Voting Last Days* email

  * ``tox -e venv -- template-emails voting_last_days``

When TC Election ends:

* Close the election
* Run: ``tox -e venv -- close-election --round tc``

  * ``edit doc/source/results/release/tc.yaml`` setting the winners to ``true``
  * Commit change and push review

* Send *TC Results* email

  * This is ``doc/source/results/release/announce_tc.rst`` generated by
    building the docs with ``tox -e docs`` after
    ``doc/source/results/release/tc.yaml`` has been created and updated

* Update ``reference/members`` in governance repository

  * Add new members
  * Remove ``chair`` and ``vice-chair`` from file
  * Commit change and push review

* Update ``tc-election-summary.py`` with election statistics
* Optionally send *TC Election Statistics* email
