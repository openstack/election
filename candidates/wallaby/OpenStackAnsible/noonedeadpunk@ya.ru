Hey everyone!

This cycle I've decided to take part in elections and run for PTL of the
OpenStack-Ansible project.

I feel that OSA nowadays is a solid and stable project, and we're doing
a great job to get all features in time and deploy only modern software with
our deployments, as well as providing deployers with a high range of
different supported options and flexibility. It's rather important to keep up
with the progress.

And there are main things I'd love to focus on during the upcoming release:

# Integration tests coverage for all roles
Despite migrating tests for most of the projects to the integrated repo,
we still have several projects not covered with proper testing (like Zun).
I also would love to pay attention to passing appropriate tempest scenarios for
all projects instead of running some default ones.

# Cleaning up bugtracker
I think one of our highest priorities should be project stability. And
taking care of bugs might help us heavily with that. We haven't been
paying enough attention to our Launchpad for a while and I think we should change
that by cleaning up stale bugs, so we could focus on real ones.
Returning bug triage to the meeting might be also an efficient way to handle them.

# Roles cleanup
We have a lot of things left in code, like workarounds for upgrades,
upstream bugs, support for obsolete operating systems, etc.
Removal/replacement of deprecated OpenStack options should be also included.

# Usage of the new pip resolver
Our venv build process relies on provided constraints heavily, which isn't valid in
case of the new pip resolver usage, so we will need to make appropriate adjustments
into the process to keep the ability to define specific package requirements and use
modern pip.


Thank you for taking into consideration my nomination.
