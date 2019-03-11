Hi,

I'm Renat Akhmerov. After a year break I'd like to announce my PTL candidacy
for Mistral in Train cycle.

In the last two years we've been mainly focused on improving Mistral
performance and the reason for this was that some big users began to adopt
it for their production needs. The amount of work done in this area was
huge and the result is orders of magnitude boost for a number of use cases.

Although much was done and the core of the technology is pretty mature now,
there's still a lot ahead:

1. Continue to improve performance (e.g. "join" tasks)
2. Make the technology more product-like. That is, eliminating obvious gaps
   in the documentation (inconsistent structure, lack of tutorials, etc.),
   installation and configuration tools, tools for developing custom actions
   and functions easier and plugging them in easier. The ultimate goal here
   is to make sure that a new user can start using the technology within
   minutes, and the experience should be as positive as possible.

Another thing that I'd like to do is to attract more talented and qualified
contributors, i.e. to make the project community stronger. So if one has
interest in working on Mistral we're always open and ready to help witn
getting up to speed.

Most likely, not all of the things mentioned above will be done in Train
but I want to make sure we finally started addressing #2 in a more serious
way than before.

The best way to get in touch with us is IRC channel #openstack-mistral or the
openstack-discuss mailing list (with [mistral] tag in email subject).

Renat
