Hello everyone,

I would like to announce my candidacy for Cinder PTL for the Victoria cycle.

Given that I'm the current PTL, you already have a pretty good idea of what
things will be like on the Cinder project with me in that role and whether or
not it would be a good idea for me to continue.  So instead of bribing you with
campaign promises, I'd like to take this opportunity to look at the current
state of the project and what things look like for the Victoria cycle.

The Cinder community remained fairly stable from Train to Ussuri, which was
great in these downsizing times.  Some of the drivers that were marked
'unsupported' for the Train release have been restored to 'supported' status
during the Ussuri cycle.  Some, however, have not.  We relaxed the removal
policy to give vendors more time to address CI issues and to make it easier for
operators using such drivers.  We'll see during the Victoria cycle whether this
actually encourages the vendors of drivers that have been declared
'unsupported' to get their third-party CIs running again and having the drivers
reinstated.

During Ussuri, the team gained more testing expertise, particularly around
creating more scenario tests, though this hasn't been reflected yet in
committed code.  As we get more scenario tests into the cinder-tempest-plugin,
we'll be able to catch more bugs that affect multiple drivers, whereas now what
mostly happens is that driver maintainers fix these piecemeal as they become
aware that they affect their drivers.  Thus, increasing the scnario test
coverage will continue to be a focus in Victoria.

The virtual PTG that we held as a follow-up to the Shanghai PTG was productive,
as were the two virtual mid-cycle meetings we had this cycle.  So I think we're
in good shape to make the most of the fully virtual Victoria PTG.

I think as a community, we're all doing good work on the Cinder project.  We've
got cinderlib to keep us relevant in a container-oriented world, and I think
we're doing a solid job keeping the software stable and reliable.  I'm sure the
driver maintainers would like to see faster review turnaround (as would we
all), so it will be a priority early in the cycle to identify contributors
interested in becoming members of the cinder-core team and mentoring them along
so that we can eventually increase the size of the core team during the cycle.

In short, things are good, they could be better, and I'd like the opportunity
to help drive the project as Victoria PTL.

Thank you for your consideration,
Brian Rosmaita (rosmaita)
