Hi All,

I would like to announce my candidacy for PTL of the Cinder project for
the 2024.2 cycle.

I think Rajat has done an excellent job serving the project and I would
like to carry existing efforts forward while continuing to focus
maintaining a healthy and productive community around the Cinder
project.

I've been contributing to the Cinder project in varying capacity for
close to 10 years.  I've worked on migration and replication at the
driver layer, mentored new contributors from the outreachy project, and
provided bug fixes and reviews wherever possible.  I'm a core reviewer
and also a stable core.  I have served as the release liaison for the
last 2 cycles and run a weekly bug squashing meeting to help maintain
our launchpad backog.

We continue to face review bandwidth pressure.  Emphasis should be
placed on encouraging contributors to do code reviews and to recognize
the efforts of those currently participating.  There are several
potential core reviewers and I feel that empowering the community is one
way to increase engagement and the quality of our releases.

3rd party CI continues to be crucial resource for evaluating
driver-specific changes.  Maintaining good 3rd party CI for the drivers
supported in Cinder by providing clear documentation and requirements
will be a focus.

Additionally, we have room for improvement in our backup and restore use
case.  My goal is to improve the entire backup/restore situation so that
it can be leveraged by users in production environments.  Our customers
are using 3rd party backup products to backup workloads and volumes and
I think this is one are where improvements here can directly benefit
users.

In summary, I would like to continue the efforts made by Rajat and
continue to focus the areas most in need of attention for the 2024.2
cycle.  I will do my best to make a positive contribution to both the
technical and community aspects of Cinder during my time as PTL.  Thank
you for your consideration.

Jon Bernard (jbernard)
