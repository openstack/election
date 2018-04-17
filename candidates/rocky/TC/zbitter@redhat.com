Hello friends,

I've been working full-time on OpenStack for 6 years now, since the very early
days of the Heat project back in 2012. Along the way I have served as PTL of
Heat, where I am still a member of the core team, and colloborated with
developers from many other projects, such as Mistral, Zaqar, Telemetry, and
Keystone. I also worked on TripleO for a while, from which I learned a lot
about both deploying OpenStack itself and deploying complex applications using
OpenStack (since it uses an OpenStack undercloud to deploy OpenStack as an
application).

Last year I wrote, and the TC approved, a resolution on the importance of
catering to applications that autonomously make use of OpenStack APIs if we are
to achieve OpenStack's mission:

https://governance.openstack.org/tc/resolutions/20170317-cloud-applications-mission.html

(Since then a lot of great progress[1] has been made, with more coming[2].)
Afterwards, a number of people remarked that up until that point, despite being
familiar with all of the pieces, they had never really connected the dots to
realise that there was no secure way for an application to authenticate to the
OpenStack cloud it is running in without extensive manual intervention from the
cloud operator.

I'm running for election to the Technical Committee because I think it's
important that we have a TC that can, collectively, connect the dots in as many
different ways as possible, to cater to the many different users and potential
users of OpenStack. There are important discussions ahead -- both within the
technical community and between the TC and the Board -- about where to draw the
boundaries of OpenStack; the more user viewpoints that are represented, the
better the result will be. We don't get as much feedback from developers of
cloud-aware applications as we do from other end users, because in many cases
OpenStack doesn't yet meet their minimum requirements. That is the gap I am
hoping to bridge. If we succeed, OpenStack will not only gain a lot more users,
but I expect more users will become contributors. I know from long experience
that keeping up with the activity of the TC requires a substantial time
commitment; I am fortunate to be in a position to contribute and I hope to be
able to represent many of y'all who are unable to devote that amount of time.

I also plan to work with the TC to find more ways to guide projects toward
maturity once they have joined the OpenStack community -- something we largely
lost when the old incubation process went away.

Questions and comments are welcome!

thanks,
Zane.


[1] https://docs.openstack.org/keystone/queens/user/application_credentials.html
[2] https://specs.openstack.org/openstack/keystone-specs/specs/keystone/rocky/capabilities-app-creds.html
