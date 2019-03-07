Hi all,

I would like to nominate myself to be the Karbor PTL for the Train cycle.

I began to contribute to Karbor project since 2016, as a core reviewer from
Queens cycle and serve as PTL in Stein. It's a completely different experience
for this role and it's a big responsibility to continue to promote the
development of the Karbor project.

In Stein, due to the loss of contributors, our development pace has slowed
down, but we also do a good job. We mainly focused on bug fixing and the
optimization of cross-site backup and restore, and do a lot for improving the
checkpoints management in different bank cases, added new API for doing
checkpoint state reset. The unit test coverage and document has also been
improved.

For the next cycle, I think we will main focus on the following items:

- Refactoring the bank concept. Support using database as a new bank driver, so
  we can store the metadata in databases in specify cases
- Support using RBD as a new bank
- Continuous optimization the implementation of multiple nodes of
  operation engine
- Improve backup and recovery efficiency
- Improve unit test coverage

For Karbor, this is a special moment. We need focus on the project improvement
to make Karbor better using and cover more use cases, so we can attract more
developers from all over the world.

I have working with Karbor for several cycles, and I have a deep understanding
of the codebase and inner working of Karbor, so I am coming to nominate myself
to be the Karbor PTL for Train cycle.

I would be honored to have your vote.

Thanks,
Jiao Pengju (jiaopengju)
