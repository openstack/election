Hello everyone,

I would like to announce my candidacy for the role of PTL of Glance for
the Ussuri cycle.

I have been working closely with several previous PTL's like Erno and Brian
and I am hoping to contribute back to the community as a PTL while following
their excellent example.

I've been working primarily with Glance since Icehouse and do work full-time
on Glance upstream. During that time I've served community in release liaison
role, as Glance core reviewer and part of Glance bugs team. I have represented
Glance in interactions with various teams, such as the cross-projects
interactions, API workgroup, documentation and OSIC. Even though I work in
GMT+05:30 time zone, I am flexible enough to catchup with peoples who were in
US or European timezone.

I have seen lots of highs and lows of the Glance and am proud that we have not
only survived but also becoming strong. During the Train cycle we have
managed to release glance-store version 1.0 which supports multiple
stores configuration.

This is how I want to focus for Ussuri cycle

1. Multiple stores support

As glance-store v1.0 is out with multiple stores configuration support, I
want to make sure Glance is able maintain it's backward compatibility
and doesn't break any cross-project workflow. Most of the work is already
done during Train cycle but in case if any bug occurs then it will be
solved on the high priority. Multiple stores will also play role in Edge
computing, so if any enhancement is required then it will be handled on
top priority.

2. Glance cluster awareness

With Interoperable Image Import and new edge usecases, Glance cluster
awareness [0] is most important feature. Even the basic implementation
has started during Train cycle, we want to use this in caching
operations which will be carried out during this development cycle.

3. Bridging gap between Glance and Horizon

Glance has now added new features such as new import workflow, import
plugins, hidden images etc. Horizon is yet to implement these in the
dashboards. I am going to put some efforts in communication with horizon
team and help them to understand/implement/bridge this gap.

4. Catching up with tempest

Similar to horizon, Glance needs to have tempest upto-date with new image
import workflow, hidden images, multiples stores scenarios. I would like
to catchup with tempest team and extend a hand to bridge this gap.

5. Community priorities

Whatever community goals put forward by TC, as a PTL of Glance
project will want to adopt these as a priority for Ussuri cycle.

6. Other

As we are very short team at this moment, I would like to put some efforts
in attracting some contributors, help them to understand how Glance
functions and encourage them to contribute for Glance.

Looking at past how Erno and Brian has steadied the ship, I know its a big
task and with their help I will do my best not to fail the expectations.


Thank you for consideration,

Abhishek Kekane

[0] https://review.opendev.org/#/c/664956/2/specs/train/approved/glance/cluster-awareness.rst
