Hi all,

I would like to announce my candidacy as Tacker PTL for the upcoming
Stein cycle.

I am Dharmendra Kushwaha known as dkushwaha on IRC. I member of Tacker
community since Mitaka release. During my journey, I was involved in multiple
features development activities(like Network Service, alarm based monitoring,
VNFFG-NS etc.), bug triages, fixes and code improvement activities, verifying
and testing for team.

It is a great experience for me to working in OpenStack/Tacker project with
very supportive contributors team. Other than community, I was involved in
couple of NFV related PoCs and to identify the production gaps in Tacker.

As of now Sridhar and Gong sheng Yang have done a great job with a great team
support, I have learnt many things from them and would like to serve the
community on those footprints.

During the journey, Tacker comes with multiple rich features and still growing
in the same direction. Still we have to do lot more and my main goals of Stein
are as follow:

* Tacker CI/CD Improvement:
    - Currently in Tacker more scenarios and proper integration testing is
      lacking on gate, needs to introduce more coverage.
    - Focus to introduce more functional and scenario tests for max code
      coverage.
    - We have to setup a process where every code should go with proper
      integration test on gate.

* Tacker stability & production ready:
    - Identify industries requirements and prioritize their requirements.
    - Focus to have more error-handling and significant logging.
    - Cross community contribution for feature integration.
    - Parallel/large node deployment stability.
    - More towards NFV-MANO rich features.

* Growing the community with more active core contributors.

* More physical gathering of Tacker team in OpenStack conferences.

You can find my complete contributions here:
http://stackalytics.com/?release=all&project_type=all&metric=commits&user_id=dharmendra-kushwaha

Thanks for reading and consideration my candidacy.

Thanks & Regards
Dharmendra Kushwaha
IRC: dkushwaha
