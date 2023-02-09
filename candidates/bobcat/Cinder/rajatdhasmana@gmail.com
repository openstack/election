Hi All,

I would like to nominate myself to be Cinder PTL during the 2023.2 (Bobcat)
cycle.

I have been serving as the PTL for the last two cycles i.e. Zed and 2023.1
(Antelope) and there were a lot of key areas which we were able to improve
as follows:

* Review bandwidth and quality: Cinder's policy of "Do reviews to get reviews"
has helped improve the review bandwidth and we have seen more participation
and activity in code reviews.
We have also added efficient review guidelines[1] to help new contributors
onboard to the review process quickly and help them do quality reviews.

* cinderclient to openstackclient migration: We are working towards reducing
the parity between cinderclient and openstackclient and the effort can be
tracked with this topic[2]. Currently we have proposed all the commands that
were missing in openstackclient.

* Third party CI to report on os-brick changes: The third party vendor CI's
used to report only on cinder gate and not on os-brick gate which means their
driver wasn't tested with the connector and they could only see issues when
the os-brick release happens. Unfortunately, the driver merge deadline is
milestone-2 and os-brick (non-client library) release is 1 week before feature
freeze so it doesn't give enough time for driver maintainers to fix the issues.
Reporting the CI on os-brick gate helps identify issues earlier and fix them
timely.

* Security Vulnerabilities: We went through the open security issues in Zed
and triaged their priority and importance.
A new security issue was reported in 2023.1 regarding VMDK file format for
which a CVE has been filed, CVE-2022-47951 [3]. We have addressed the issue
and releases were done for the actively maintained stable branches
i.e. Zed[1], Yoga[2] and Xena[3].

Apart from that, we were able to handle deadlines better by managing and
prioritizing work based on the milestones.

Following are the plans for the 2023.2 cycle:

* our first target will be to move away from adding additional commands to
cinderclient and only rely on openstackclient for the CLI interface. Also we
will explore openstacksdk to add support for cinder commands so we can break
the dependency on the python bindings that exist in cinderclient.

* Another thing to address is adding the service role after the keystone
implements it[7].

* Third party drivers are the core of cinder that allows cinder to what the
end users desire i.e. to interface between users and storage backends.
We will focus to improve the experience of driver vendors to implement new
drivers by improving our driver documentation and test stability by doing a
3rd party CI compliance check.
We have been making progress in this area but more efforts are required that
we will target for the next cycle.

Finally will try to continue all the good things we have started that keeps the
project healthy and active and also address new gaps discovered along the way.

[1] https://docs.openstack.org/cinder/latest/contributor/gerrit.html#efficient-review-guidelines
[2] https://review.opendev.org/q/topic:add-missing-cinderclient-commands
[3] https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-47951
[4] https://pypi.org/project/cinder/21.1.0
[5] https://pypi.org/project/cinder/20.1.0
[6] https://pypi.org/project/cinder/19.2.0
[7] https://review.opendev.org/c/openstack/keystone/+/863420

-
Rajat Dhasmana
