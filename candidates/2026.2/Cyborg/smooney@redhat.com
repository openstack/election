Hi all,

I am announcing my candidacy for the Cyborg PTL role for the 2026.2 cycle.

Background:

I have been a Nova, Neutron, and general OpenStack contributor for over a
decade, with deep experience in accelerator management, PCI passthrough,
and the Nova-Cyborg integration.

In January 2026, I started the conversation about bringing Cyborg back to
a fully maintained state on the mailing list. This work has already begun
with gate stabilization patches, and in the same vein, I'm hoping to
support community re-engagement.

I have spent the past 18 months revitalizing the Watcher project with a
small group of contributors back to active development with regular
releases and CI improvements. I am confident the same approach can succeed
for Cyborg.

Priorities for 2026.2

CI/CD and Testing Improvements:

* Align CI jobs with 2026.2 runtimes
* Add stable branch jobs to cyborg-tempest-plugin
* Develop Grenade and SLURP upgrade testing
* Expand functional testing beyond the "fake" driver using mtty/mdpy for
  mdev testing
* Explore similar methods for PCI testing

Governance and Community:

* Restart IRC meetings for regular coordination
* Bug triage and backlog review (open bug team)
* PTG arrangements and topic planning

One of the topics for the PTG will be adopting the Distributed Project
Leadership (DPL) model to share responsibilities or continuing with the
PTL model. Note: in either event I hope to work with release and other
liaisons to reduce single-point-of-failure risks.

Feature Development:

* Complete the Cyborg mdev-based vGPU support in Nova
* NVMe lifecycle management
* PCI group support

Strategic Architecture (longer-term 2027.1+):

* Review Cyborg device modeling in Placement
* Nova-Cyborg integration improvements (attach/detach/move accelerators)
* Review the evolution of existing and new drivers to provide generic
  drivers for each bus/interface with vendor-specific drivers that share
  the common logic

Cyborg has been dormant for several cycles, but the use-cases for
accelerator management in OpenStack have grown, and Cyborg is positioned
to play a role in the overall OpenStack architecture to enable these
emerging workloads.

Thank you for considering my candidacy.

Sean Mooney (sean-k-mooney)
