Hello again friends,

I'm running again for a second term on the Technical Committee. (For the
record, I don't plan to seek a third term next year.) I've been part of the
OpenStack community since 2012, and as well as a TC member I am also a core
reviewer for Heat and (since very recently) Oslo.

I think of the TC as effectively the 'core reviewer' team for a larger group of
folks who participate in the governance of OpenStack (a group that I think we
should be aiming to expand even further). I'm deeply grateful to the community
for giving me the opportunity to work with what is a fantastic team of people.

Here's what I've been up to in the past year on the TC:

- I supported Julia's initiative to spread constructive code-review techniques
by distilling some of our annual endless threads on code-review etiquette
into a linkable page in the Project Teams Guide.[1] A number of people, in one
case an entire team, told me that they'd tweaked their approach to code review
after getting ideas from this document. (This feedback is *much* appreciated by
the way, because from the TC perspective it can be very hard to tell the
difference between achieving lazy consensus and shouting into the void.)

- I wrote the draft of and edited contributions to what became the Vision for
OpenStack Clouds,[2] contacted every affected team to explain what it meant
for them individually, and presented it to the OSF Board in Berlin for their
feedback as well.

- I helped drive the definition of a process for determining which versions of
Python3 should be tested in a release.[3] That should help us make the
transitions smoothly in future, though it unfortunately started too late for
Stein.

- I've been actively engaged with members of the OSF Board on the topic of the
process for adding new Open Infrastructure projects to the Foundation, by
passing on feedback from foundation members and from the TC's own experience
with evaluating project applications, and trying to publicise the board's
position in the community.[4]

It's hard to imagine being able to get any of those done without being a TC
member. As I've written elsewhere,[5] because the TC is the only project-wide
elected body, leading the community to all move in the same direction is
something that cannot happen without the TC. I plan to continue trying to do
that, and encouraging others to do the same. Thanks for your consideration.

cheers,
Zane.

[1] https://docs.openstack.org/project-team-guide/review-the-openstack-way.html
[2] https://governance.openstack.org/tc/reference/technical-vision.html
[3] https://governance.openstack.org/tc/resolutions/20181024-python-update-process.html
[4] https://www.zerobanana.com/archive/2018/06/14#osf-expansion
[5] http://lists.openstack.org/pipermail/openstack-discuss/2019-January/001841.html
