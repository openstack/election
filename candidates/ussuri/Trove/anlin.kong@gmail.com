I'm writing this in order to announce my candidacy for Trove PTL during
the U development cycle.

It has been an honor to serve as Trove PTL during Train, although I'm
almost the only person who did the most of contribution to the project.
The motivation is we are running Trove in a private cloud, and we have
plan to run Trove in our public cloud in the near future as well. Here
are what we have achieved in Train:

- Coordinated with the community to finish the community goal of running
  DevStack on Ubuntu Bionic.
- Changed Trove devstack script to install Trove in service tenant model
  which made Trove devstack deployment more close to the real
  environment.
- Improved the trovestack script to make it much easier to create Trove
  guest image, either for development or for production.
- Added some config options for administrative tasks, giving the cloud
  admin more control of how Trove instance is deployed.

However, there are still lots of TODOs in my backlog, e.g.

- All other databases CI jobs are failing except Mysql, there is lack
  of contributors or maintainers for those databases, hopefully there
  will be someone who already deployed Trove in production can offer
  some help.
- Trove functional tests are not stable and prone to failure. In
  addition, due to the long time of creating a database instance, the
  current scenario test is reusing instances and executed sequentially.
  We have plan to move scenario tests from in-tree repo to
  trove-templest-plugin and refactor the test structure.
- Support monitoring capability in Trove which is quite important for
  public cloud.

Considering the current OpenStack upstream contribution situation, I'm
not expecting I could finish all of them in a single dev cycle, but I
will try my best to move Trove forward.

Lingxian Kong (lxkong)
