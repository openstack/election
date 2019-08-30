Hi,

I'm Renat Akhmerov. I'd like to announce my PTL candidacy for Mistral in
U cycle.

In Train, we again made a big step towards having better performance, which
turned to be very important for real production use cases. Mistral "join"
mechanism is now much more CPU and RAM efficient (60-70% faster for same
workflows). Mistral now also provides a mechanism to plug in an alternative
scheduler implementation. The new implementation of scheduler, which designed
to be more scalable, is now available and being tested.

For U cycle I'd like to focus on making Mistral more usable:

 * Consistent and well-structured documentation
 * Additional tools that simplify creating custom actions and functions
   for Mistral
 * Easier debugging of workflow errors
 * Easier and smoother installation process

Some of the mentioned activities are already going on. For example,
we added the workflow execution report that, when requested, shows the
entire execution tree (including sub workflows). That allows to see
error paths (and hence root causes) w/o having to do many copy-paste
actions.

It's not a secret that in the last few cycles there was a struggle with
attracting more active contributors. Now, we finally have several very
talanted engineers fully allocated to work on Mistral. So it makes me
believe that we'll be able to solve a number of big tasks (including
cool user facing goodies) that we had to put on a shelve just for the
lack of resources.

As usually, anybody is welcome to join our team! It's a fun project
to work on.

The best way to get in touch with us is IRC channel #openstack-mistral
or the openstack-discuss mailing list (with [mistral] tag in email subject).

Renat
