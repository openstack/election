Greetings my OpenStack family!

I realize we are presently in a stressful time. That each of us are
worrying, and that many of us are struggling. "Normalizing", and ultimately
accepting the things we cannot control is a vital step forward in our
personal and community growth. Finding a path forward is critical in
this time. Not just as humans in a pandemic, but as also community
members in a project. The vital aspect is continuous across both contexts:
We cannot do it alone, We must work together!

I too have strengths and weaknesses that I am all too well aware of,
and there truly is nothing more re-assuring than those around you
encouraging you to continue to support them. For we all need
sturdy foundations to take the steps forward. To build the next layer!
To continue the journey we are on.

As such, I hereby announce my candidacy for the role of Project Team Leader
for the Ironic project during the Victoria cycle. That is if you will have me.

I foresee the upcoming cycle as a time when we will need to be there to
support our community and users.

This may take the form of advanced features, lending an occasional ear,
or going that extra mile to help each other.

And if we need a distraction, I believe we have have some difficult problems
yet to solve which can have a major impact in not just our code,
but the world at large. While not an exhaustive list of items, it is still
an impactful list of work we have been discussing and seek to add into
Ironic moving forward.

* Multi-tenancy, while underway, opens the world to new possibilities and
  co-ordination of hardware resources with-in an organization.

* Persistent Agents allowing for faster re-provision of deployments on
  the edge and where the networking is in a fixed configuration.

* TLS for Agent Communication to help ensure the nodes on the edge remain
  secure.

* kexec could potentially save significant amounts of time between steps
  of deployment, and enable operators with larger memory footprints to save
  precious time of a Power-on-Self-Test.

* Attestation system integration so we can improve the odds of identifying a
  machine with modified firmware and prevent it from moving through the
  hardware life-cycle as a result.

* Enhancement of power management, so operators can avoid having to wait
  for the Power-on-Self-Test, and maybe even power some of those machines off.

Onward, together! For I'm fairly sure we've not completely taken over the
world... yet.

Julia (TheJulia) Kreger
