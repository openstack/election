I am submitting my candidacy for Oslo PTL in the Ussuri cycle.

Activity in Oslo over the past cycle was lower than it has been. I think this is a
reflection of there being fewer contributors and that many Oslo projects are quite
mature and stable. That is not to say that our job is done - we are still finding
and fixing issues related to the Oslo libraries, and I anticipate that will
continue in this cycle.

In terms of new features, the main effort will be around oslo.limit and making
it easier for projects to consume Keystone unified limits. We're getting close
to having a usable API for oslo.limit and I hope we can start integrating it
into other projects this cycle.

On a personal note, I anticipate this being my last cycle as Oslo PTL. As a result,
I plan to spend some of my time this cycle working to find and coordinate with a
new candidate for next cycle.
