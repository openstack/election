Hi everyone:

First of all, thank you very much for giving me the opportunity to be part of
the technical committee over the past term within the OpenStack project
governance. I’ve also taken the vice chair role which I have had to serve for
sometime during the time that our chair (Doug) was out of the office.

In my candidacy email for my last term, there was a few things that I brought
up which I think are still very important, as well as a few others which I
think we’ve made great progress in.  I’d like to start talking about those
first.

I still believe that it’s really important to have a contact with the users
and deployers, something that we’re slowly getting better at.  I have found
that having some of those very large operators that sit in our technical
committee meetings at the PTG super productive, because they bring an
important perspective to the technical committee.

As I help manage a public cloud and several private clouds all over the world,
I’ve seen a lot of stories about OpenStack experiences, shortcomings and
seeing how users consume OpenStack.  It’s a very eye opening experience and
it’s built up a strong basis to be able to formulate technical decisions and
understanding the impact it has on all of our different users.  I think this
information is a really strong asset.

I mentioned that we needed to work on improving our bridges with other
communities such as Kubernetes.  I’ve helped add and provide resources for
OpenLab to help bring CI for the Kubernetes OpenStack cloud provider, worked
on Magnum changes to help better integrate and test the project and even added
resources which allowed Magnum to run full functional Kubernetes tests in it’s
gate (with a work in progress of adding conformance tests).  While the TC is
about governance, I also think it’s important for us to get some work that
gets the critical moving pieces running done.

I’ve also worked with a few teams in order to help and somehow mediate a
discussion to facilitate the split of the placement service and provided
operator feedback, participated in the split meetings and helped to push
things in the direction to make it happen.  However, learning a few lessons
in the way about how we might go about doing something like this in the future.

I’ve also increased my engagement with our APAC community by speaking more
often with them over WeChat.  There is a tremendous amount of knowledge and
wonderful community of people who want to participate.  I’ve tried my best to
also build a ‘bridge’ by sharing things that might make sense for them to see
from our mailing lists (for example, the most recent one about our upcoming
release name).

For the upcoming term, I think that we should work on increasing our
engagement with other communities.  In addition, providing guidance and
leadership for groups and projects that need help to merge their features,
even if it involves finding the right person and asking them for a review.

I’d like to personally have a more “hands-on” approach and try to work more
closely with the teams, help shape and provide input into the direction of
their project (while looking at the overall picture).  I’d also like us to try
and be more engaged with the other OSF projects such as Kata containers,
StarlingX, Airship and Zuul.  While the last one is our darling that was
created out of our use, I think providing a bridge with the others would
provide a lot of value as well.

Thank you for giving me the opportunity to serve as part of your technical
committee, I hope to be able to continue to help over the next term.

Regards,
Mohammed
