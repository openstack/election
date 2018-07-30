Hi,

I'd like to nominate myself to serve as Kolla PTL
through the Stein cycle.

I've been contributing to Kolla project for over 2 years and a half.
Working with Kolla it's been an awesome experience from which I've growth
technically and personally.

My goals for the Stein cycle are:

Kolla images
------------

1) Keep working on maintaining images stable.
2) Add CI coverage for other deployment tools such as TripleO.

Kolla-ansible
-------------

1) Improve CI coverage for non core OpenStack projects through testing
   scenarios, also upgrade gate jobs.
2) Implement fast-forward upgrades as well as finishing rolling-upgrades.
3) Allow other projects to test their code within kolla-ansible.
4) Add more networking options to operators, such as Calico.

Kolla-cli
---------

1) Encourage operators to use kolla-cli instead of kolla-ansible commands.
2) Encourage other community members to also contribute into CLI code.

Global goals
------------

1) Attract and retain more contributors.
2) Share knowledge about CI, releases, etc. through all community members.

Thanks for taking the time to read through this roadmap and to consider my
candidacy.

Regards,

Eduardo Gonzalez
