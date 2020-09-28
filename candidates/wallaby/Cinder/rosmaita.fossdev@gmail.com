Hello everyone,

I hereby announce my candidacy for Cinder PTL for the Wallaby cycle.

I've been PTL for two cycles, so you have a pretty good idea by now of what
it's like to work on the Cinder project with me in that role, and whether or
not it would be a good idea for me to continue.

There are a few things I'd like to see the project emphasize during the Wallaby
development cycle; hopefully the team will self-organize around these themes.

* Continued development of the cinder-tempest-plugin.  We need more automated
  tests for more complicated scenarios, partly to prevent regressions for
  fixed bugs, but also to detect some problems before they are reported
  by users.

* Better understanding of why some of the gate jobs are intermittently
  failing, particularly the backup-related tests in the tempest-storage
  suite.

* Better review bandwidth.  The core team we carried over from Ussuri to
  Victoria is still active, but as their careers have progressed, they have
  taken on more responsibilities in their day jobs, and their review counts
  have declined a bit.  We added Lucio as a new core during Victoria; it would
  be good to add another person or two during the Wallaby cycle.  Anyone
  working on the cinder project who's interested in working to get themselves
  into a position where they could be nominated as a cinder core, please
  contact me (or any of the current cores) to discuss what the expectations
  are.

Those are what's been on my mind lately.  As far as specific features, etc.,
those will emerge from our PTG discussions, to which I encourage you to
contribute:
  https://etherpad.opendev.org/p/wallaby-ptg-cinder-planning

We've had productive virtual mid-cycle meetings for two cycles now, and the
cinder-weekly-meeting-once-a-month-in-videoconference seems to help keep the
team connected, so I'd like to continue that.  The team adapted well to the
virtual PTG format for Victoria, so I'm confident we'll have a productive
virtual Wallaby PTG, though I sincerely hope we'll once again have the
opportunity to meet face-to-face for the 'X' PTG.

As far as external interest in the Cinder project goes, we've added some new
drivers in Victoria and already have one new driver proposed for Wallaby, with
at least one more on the way, which is nice.

Thanks for reading this far, and thank you for your consideration.

Brian Rosmaita (rosmaita)
