Hi,

I'm Renat Akhmerov. I'd like to announce my PTL candidacy for Mistral in
Victoria cycle.

In Ussuri, we kept improving Mistral performance to address use cases
that desperately needed it. For the most complex known workflows the
execution time has now dropped by 5-6 times. Besides lots of performance
changes we also achieved:

 * Restructured the documentation completely
 * Fixed a number of documentation pages and added several new ones.
   There's still a lot to do on that though.
 * Made a big refactoring of Mistral actions and moved all OpenStack
   actions into mistral-extra repo.
 * Added namespaces for actions and workbooks
 * Added a new cookiecutter-based template for creating Mistral action
   projects.
 * Fixed a number of important bugs (for "join" tasks, scheduler etc.).
 * And lots of other changes..

For V cycle I'd like to keep making Mistral more usable:

 * Consistent and well-structured documentation
 * More ways to create Mistral actions (including action providers)
 * Additional tools that simplify creating custom actions and functions
   for Mistral
 * Easier debugging of workflow errors
 * Easier and smoother installation process

We're already making a good progress with all that and anybody who wants to
participate is very welcome onboard.

The best way to get in touch with us is IRC channel #openstack-mistral
or the openstack-discuss mailing list (with [mistral] tag in email subject).

Renat
