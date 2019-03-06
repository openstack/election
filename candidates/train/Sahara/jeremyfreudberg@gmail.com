Hello all!

This is an official announcement of my candidacy for PTL of Sahara for the
Train development cycle.

# Who I am

My first introduction to Sahara was in the summer of 2016, as an operator. It
wasn't long until I sent my first patch upstream. Following the first PTG in
Atlanta in 2017 I became increasingly involved with the project and later that
year I became a core reviewer for Sahara. I must emphasize that all of this was
set off by a series of fortunate coincidences; regardless, it's still a nice
story of OpenStack gaining a new (and lasting) contributor.

My affiliations remain with Red Hat and the Massachusetts Open Cloud (both of
which have at various times funded my work on Sahara).

Like many 22-year-olds, I'm about to finish undergrad: I studied computer
science and linguistics.

# Goals for Train

I am impressed with what we have accomplished in past cycles with such a small
team. We've implemented big features (APIv2, out-of-tree plugins) and kept up
with the pace of OpenStack as a whole. Looking at where we stand now I propose
that we focus on the following areas during the Train cycle:

* Castellan/Barbican integration: it's been broken for an embarrassing amount
  of time, yet it's a highly desirable feature.

* Python support for Spark EDP jobs: many users come to Sahara expecting this
  but then leave disappointed... it's time to bite the bullet.

* Finishing transition to sahara-image-pack: let's have support for all our
  plugins in a single tool, so that sahara-image-elements can be deprecated.

* Rehoming sahara-extra: the code should be hosted in one place, and I believe
  that place should be Apache's repository, where it will receive proper care.

I have chosen these goals as a strategic investment into the reduction of
future maintainers' pain. The emphasis is on fixing existing features and
cutting down the number of components to maintain.

Any extra capacity should be directed towards plugin upgrades or towards
increasing the breadth of scenarios tested in upstream CI.

# Beyond Train

It is hard to tell what the future will hold. The team is at its all-time
smallest. I'd suggest that the focus on stability continues.

# Acknowledgements

We owe a massive debt of gratitude to Telles Nobrega, who heroically served as
Sahara PTL for four exhausting-yet-rewarding cycles. I also want to thank all
those who have ever contributed to Sahara (or to Savanna, or, for the trivia
nerds, EHO). We wouldn't be here without you.

# Conclusion

I'm continously honored to be a part of the OpenStack community and of the
Sahara team.

Thanks for your consideration.
Here's to a great cycle.

Best,
Jeremy
