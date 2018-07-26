Howdy!

I am submitting my name to continue as PTL for Chef OpenStack. If you
don't know me, I am scas on Freenode. I work for Workday, where I am an
active operator and upstream developer. I have contributed to OpenStack
since 2014, and joined the core team in early 2015. Since then, I have
served as PTL for four cycles. I am also an active member of the
Sous-Chefs organization, which fosters maintainership of community Chef
cookbooks that could no longer be maintained by their author(s). My life
as a triple threat, as well as being largely in the deploy automation
space, gives me a unique perspective on the use cases for Chef
OpenStack.

Development continues to run about a release behind the coordinated
release to stabilize due to contributor availability. In that time,
overall testing has improved to raise the overall testing confidence in
landing more aggressive changes. Local testing infrastructure tends to
run closer to trunk to keep a pulse on how upstream changes will affect
the cookbooks closer to review time. This, in turn, influences the
changes that do pass the sniff test.

For Stein, I would like to focus on some of the efforts started during
Rocky.

* Awareness and Community

  Chef OpenStack is extremely powerful and flexible, but it is not easy
  for new contributors to get involved. That is, if they can find it,
  down the dark alley, through the barber shop, and behind the door with
  a secret knock. Documentation has been a handful of terse Markdown
  docs and READMEs that do not evolve as fast as the code, which I think
  impacts visibility and artificially creates a barrier to entry. I
  would like to place more emphasis on providing this more well-lit
  entry point for new and existing users alike.

* Consistency and HA

  Stability is never a given, but it is pretty close with Chef
  OpenStack. Each change runs through multiple, iterative tests before
  it hits Gerrit. However, not every change runs through those same
  tests in the gate due to the gap between local and integration. This
  natural gap has resulted in multiple chef-client versions and
  OpenStack configurations testing each change.  There have existed HA
  primitives in the cookbooks for years, but there are no published
  working examples. I am aiming to continue this effort to further
  reducing the human element in executing the tests.

* Continued work on containerization

  With efforts to deploy OpenStack in the context of containers, Chef
  OpenStack has not shared in the fanfare. I shipped a very shaky dokken
  support out of a hack day at the 2017 Chef Community Summit in
  Seattle, and have refined it over time to where it's consistently
  Doing A Thing. I have found regressions upstream (e.g. packaging), and
  have conservatively implemented workarounds to coax things into
  submission when the actual fix would take more months to land.  I wish
  to continue that effort, and expand to other Ansible-based and
  Kitchen-based integration scenarios to provide examples of how to get
  to OpenStack using Chef.

These are but some of my personal goals and aspirations. I hope to be
able to make progress on them all, but reality may temper those
aspirations.

I would love to connect with more new users and contributors. You can
reach out to me directly, or find me in #openstack-chef.

Thanks!

-scas
