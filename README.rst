==================
openstack/election
==================

This repository contains OpenStack Elections reference documents
and tooling to run elections.


Election officials process
==========================

=============
PTL Elections
=============

Selecting Election Dates
------------------------

Things to keep in mind when selecting election dates:

* At least 48 hours in between email deadline and poll start
* Consider extra-atcs approval deadlines
* Should start around R-4 for nominations period
* Allow at least a week for nomination period

Preparation
-----------

A month before election starts:

* Edit elections details (timeline, cycle timeframe):
  * edit configuration.yaml
* Prepare new election, e.g.:
  * tox -evenv -- create-directories
* Update index.rst to include ptl.rst
* Commit to update website
* Update Release Schedule

A couple of weeks before election starts
* Send 'PTL Election Season' email


PTL Candidacy Round
-------------------

When PTL Candidacy start
* Send 'PTL Nominations Kickoff' email

During the PTL Candidacy round:
* Validate candidacy, e.g.:
  * tox -evenv -- check-all-candidacies, or
  * tox -evenv -- check-candidacy change_id
* To +2 a candidate:
  * check commit link is indeed valid
  * check filename is email address
  * cursory check the candidacy statement
* To +Workflow, checks the previous +2 details, find another commits using --limit 5 (optionals)

* Check candidate list and fix badly generated names through changes to the exception.txt file

Once the email deadline is reached:
* Ask the TC chair to tag the governance repository

A couple of days before the candidacy submission ends:
* Render statistics and send 'Motivation call for PTL candidacy round', e.g.:
  * tox -evenv -- render-statistics
* Send 'PTL Nominations Last Days' email

When PTL Candidacy submission ends:
* Send 'PTL Nominations End' email

When PreferredEmailDeadLine is reached:
* Ask the TC chair to tag the governance repository with the tag defined in the configuration.yaml
* When the tag is available, generate ATC rolls, e.g.:
  * tox -evenv -- generate-rolls
  * Compare ATC rolls with at least one other election official

PTL Election Round
------------------

When PTL Election begins:
* Create CIVS page ( https://wiki.openstack.org/wiki/Election_Officiating_Guidelines#Running_the_election_itself )
* Upload rolls
  * CIVS has a maximum number of electorate emails you can upload at a time without crashing, limit to 500
    at a time
* Send 'PTL Voting Kickoff' email

A couple of days before the PTL Election ends:
* Send 'PTL Voting Last Days' email

When PTL Election ends:
* Close the election and udpate the results:
  * tox -evenv -- close-election ptl
  * edit doc/sources/pike/ptl.yaml to set election winners to True
* Update index.rst to comment ptl.rst candidate list
* Commit the change and review the results
* Send 'PTL Results' email
* Update governance repo:
  * tox -e venv update-governance -- --governance-repo ../governance/

============
TC Elections
============

Selecting Election Dates
------------------------

Things to keep in mind when selecting election dates:

* Needs to conclude by S-3 (3 Weeks prior to OpenStack Summit)
* Allow for at least 48 hours between email deadline and polling begininning
* Allow at least a week for nomination and campaign periods

Preparation
-----------

A month before election starts:

* Edit elections details (timeline, cycle timeframe):
  * Edit configuration.yaml
  * Update index.rst to include tc.rst instead of ptl.rst
* Commit to update website
* Update Release Schedule

A couple of weeks before election starts
* Send 'TC Election Season' email


TC Candidacy Round
------------------

When TC Candidacy starts:
* Send 'TC Nominations Kickoff' email

During the TC Candidacy round:
* To +2 a candidate:
  * check candidate profile using https://www.openstack.org/community/members/
  * check filename is email address
  * cursory check the candidacy statement
* To +Workflow, check the previous +2 details

A couple of days before the candidacy submission ends:
* Send 'TC Nominations Last Days' email

When TC Candidacy submission ends:
* Send 'TC End Nominations' email

When PreferredEmailDeadLine is reached:
* Generate ATC rolls, e.g.:
  * tox -evenv -- generate-rolls


TC Election Round
-----------------

When PTL Election begins:
* Create CIVS page
  * Enable detailed ballot reporting
* Upload rolls
* Send 'TC Voting Kickoff' Email

A couple of days before the TC Election ends:
* Send 'TC Voting Last Days' email

When TC Election ends:
* Close the election
* Run: tox -e venv -- close-election tc
  * edit doc/source/pike/tc.yaml setting the winners to 'True'
  * Commit change & push review
* Send 'TC Results' email
* Update reference/members in governance repository
  * Add new members
  * Remove 'chair' & 'vice-chair' from file
  * Commit change & push review
* Update tc-election-summary.py with election statistics
* Send 'TC Election Statistics'
