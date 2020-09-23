Hi

I would like to nominate myself for the TripleO PTL role for the Wallaby cycle.

I think it is obvious that the role of the PTL has changed significantly
compared to the early days of TripleO. Most importantly we are (and have been
for a while) now organised into self-contained topic squads (deployment,
validations, upgrades, networking, storage, ci, etc). Typically technical
decisions are driven exclusively within those squads (even if they are done
'in the open' on gerrit and launchpad and opendev-discuss). The role of the
PTL then is more about coordination across the squads, ensuring we deliver
release targets, keeping bug backlogs in order and facilitating the resolution
of any conflicts that arise.

I have worked on TripleO since before the Kilo release and have collaborated
with many current and past members of the community including engineers and
also users/operators. My contributions thus far have been in code/docs/bugs,
originally working on upgrades and more recently working on CI.

I haven't had the opportunity to work on the 'admin' side of TripleO (besides
in the past cutting the occasional release). I am thus especially excited by
the prospect of contributing in this new way as PTL, if TripleO will have me!
I sincerely promise to give it my best and I am sure that together with the
kind help of the current PTL Wes Hayutin we will have a smooth Wallaby cycle,
meeting our responsibilities to the foundation and the community.

There is (as ever!) a lot of exciting work coming in the Victoria release and
continuing in Wallaby including the continued exploration of the removal of
Heat as our configuration engine, the new validations repos and framework,
the new container builds process, Fast Forward Upgrades II (back with a
vengeance), ci component and dependency pipelines, ci parent/child jobs, and
I'm sure many more that we will discuss at the coming Wallaby PTG. Two areas
I would like to focus on as PTL should you give me the opportunity are:

  - improve our current documentation/deployment guides - at minimum they must
    be updated to recent releases and there are many items missing. I am
    hoping to rally support from the various squads for this.
  - improve visibility into the various TripleO squads - this may mean
    re-instating a 'new' weekly/bi-weekly (or other frequency) tripleo meeting
    or by some new way of collaborating. Again this is really dependent on
    support from the tripleo community.

thank you for your consideration!

Marios Andreou
irc: marios
