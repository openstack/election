I want to propose my candidacy for Neutron PTL in the Victoria cycle.

I have been serving this great team as PTL in the Ussuri cycle already and I
would love to continue this in the next cycle as well. Ussuri was my first time
as PTL and I learned a lot during this cycle.  I think that this new experience
and knowledge which I now have will help me serve as PTL in this next cycle as
well.

In Ussuri I proposed a couple major goals which I wanted to focus on:

* merge networking-ovn driver into main Neutron repository - in Ussuri we
  actually merged networking-ovn code into neutron and made ovn driver as one of
  the main in-tree drivers for ML2. We also merged the networking-ovn core team
  into the neutron core team.

* Improve overall stability of our CI - we are continuously working to improve
  CI stability: during this cycle we added couple OVN related jobs to Neutron
  CI, and we also removed some unnecessary jobs.  Unfortunately we didn’t make
  enough progress with our CI and some jobs still need a lot of work to improve
  their stability. I think that this is a continuous effort and we will need
  to focus on it in the next cycle as well.

* Improve test coverage for existing features - we introduced many new test
  cases in the neutron-tempest-plugin repository. Many of them are covering some
  additional scenarios and advanced functionality: multicast traffic, TCP
  and UDP port forwarding, and others.  I think that this is a continuous
  effort and we will need to focus on that one in the next cycle as well.

* Finish the transition to the new engine facade - this is something which we
  didn’t make enough progress so far and I would like to treat it as a priority
  in Victoria.

* Improve the stability of Neutron when it is running under uWSGI - recently we
  promoted our uWSGI jobs to be voting. Those jobs are now pretty stable.
  I think that in the next cycle we need to finally focus on making uwsgi as
  the default in Devstack, so that it will be used in most Neutron CI job.

In addition to that I wanted to continue Miguel’s way of mentoring potential
new core reviewers and contributors, and I think that this has been working
pretty fine. In addition to the networking-ovn core team which is now part of
neutron core, we also have new core reviewer Lajos Katona and new member of
drivers team: Nate Johnston.
Our team is now in good shape and we have many active core reviewers and
contributors.

That’s my summary of what we actually achieved in the Ussuri cycle. Now let’s
talk about what are my goals for the Victoria cycle.

* Continue adoption of the OVN driver in Neutron - now that the OVN is in-tree,
  we need to think about making it the default in Devstack.

* Finish adoption of new engine facade - it’s unfinished goal from the Ussuri
  cycle and I think that we should treat it as a priority now,

* Metadata over IPv6 - we still have not finished the RFE about support for
  Metadata service in IPv6 only networks. In the Ussuri cycle we made some
  progress with the spec [1], and we also had some discussions about it with
  cloud-init developers. Now I think it’s time to finally get this spec merged
  and implement it in Neutron,

* Continue work on test coverage and CI stability - this is a never ending
  story and I think that it should be treated with high priority all the time.

It is my continuing desire to do my best to help our outstanding team to
deliver better software and to grow.

[1] https://review.opendev.org/#/c/315604/
