Hello all,

I hereby announce my candidacy for PTL of the OpenStack Charms project.

Through the course of the past two years I have made many contributions to
the Charms projects and I have had the privilege of becoming a Core developer.

Prior to focusing on the Charms project I have made upstream contributions in
other OpenStack projects and I have followed the unfolding and development of
the OpenStack community with great interest.

We live in exciting times and I believe great things are afoot for OpenStack
as a stable, versatile and solid contender in the cloud space.  It would be
my privilege to be able to help further that along as PTL for the Charms
project.

Our project has a strong and disperse group of contributors and we are blessed
with motivated and assertive people taking interest in maintaining existing
code as well as developing new features.

The most important aspect of my job as PTL will be to make sure we maintain
room for the diversity of contributions without losing velocity and direction.
Maintaining and developing our connection with the broader OpenStack community
will also be of great importance.

Some key areas of focus for Stein cycle:
- Python 3 migration
  - The clock is ticking for Python 2 and we need to continue the drive towards
    porting all our code to Python 3
- Continue modernization of test framework
  - Sustained software quality is only as good as you can prove through the
    quality of your unit and functional tests.
  - Great progress has been made this past cycle in developing and extending
    functionality of a new framework for our functional tests and we need to
    continue this work.
  - Continue to build test driven development culture, and export this culture
    to contributors outside the core team.
- [Multi-cycle] Explore possibilities and methodologies for Classic -> layered
  Reactive Charm migrations
  - A lot of effort has been put into the Reactive Charm framework and the
    reality of writing a new Charm today is quite different from what it was
    just a few years ago.
  - The time and effort needed to maintain a layered Reactive Charm is also far
    less than what it takes to maintain a classic Charm.
  - There are many hard and difficult topics surrounding such a migration but I
    think it is worth spending some time exploring our options of how we could
    get there.
- Evaluate use of upstream release tools
  - The OpenStack release team has put together some great tools that might
    make our release duties easier.  Let us evaluate adopting some of them for
    our project.

--
Frode Nordahl
