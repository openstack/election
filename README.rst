==================
openstack/election
==================

This repository contains OpenStack Elections reference documents
and tooling to run elections.


Election officials process
==========================

Preparation
-----------

A month before election starts:

* Edit elections details (timeline, cycle timeframe):
  * edit configuration.yaml
* Prepare new election, e.g.:
  * tox -evenv -- create-directories
* Update index.rst to include ptl.rst
* Commit to update website

A couple of weeks before election starts
* Send 'First announce'


PTL Candidacy round
-------------------

When PTL Candidacy start
* Send 'Opening PTL candidacy round'

During the PTL Candidacy round:
* Validate candidacy, e.g.:
  * tox -evenv -- check-new-candidacy, or
  * tox -evenv -- check-candidacy change_id
* To +2 a candidate:
  * check commit link is indeed valid
  * check filename is ircname
  * cursory check the candidacy statement
* To +Workflow, checks the previous +2 details, find another commits using --limit 5 (optionals)

* Check candidate list and fixes badly generated name using the exception.txt file

A couple of days before the candidacy submission ends:
* Render statistics and send 'Motivation call for PTL candidacy round', e.g.:
  * tox -evenv -- render-statistics

When PTL Candidacy submission ends:
* Send 'PTL nomination ending'


PTL Election round
------------------

When PreferredEmailDeadLine is reached:
* Generate ATC rolls, e.g.:
  * ./tools/generate-rolls.sh

When PTL Election begins:
* Create CIVS page ( https://wiki.openstack.org/wiki/Election_Officiating_Guidelines#Running_the_election_itself )
* Upload rolls
* Send 'PTL election opening'

A couple of days before the PTL Election ends:
* Send 'PTL vote motivation call'

When PTL Election ends:
* close the election and udpate the results:
  * tox -evenv -- close-election ptl
  * edit doc/sources/pike/ptl.yaml
* update index.rst to include tc.rst instead of ptl.rst
* Commit the change and review the results
* Send 'PTL results'


TC Candidacy round
------------------

When TC Candidacy starts:
* Send 'TC Candidacy Opening'

During the TC Candidacy round:
* To +2 a candidate:
  * check candidate profile using http://www.openstack.org/community/members/
  * check filename is ircname
  * cursory check the candidacy statement
* To +Workflow, check the previous +2 details

A couple of days before the candidacy submission ends:
* Send 'Motivation call for TC Candidacy round'

When TC Candidacy submission ends:
* Send 'TC nomiation ending'


TC Election round
-----------------
* Create CIVS page
* Upload rolls
* Send 'TC election opening'

A couple of days before the TC Election ends:
* Send 'TC vote motivation call'

When TC Election ends:
* close the election and update the results:
  * tox -e venv -- close-election tc
  * edit doc/source/pike/tc.yaml
* Commit the change and review the results
* Send 'TC results'
