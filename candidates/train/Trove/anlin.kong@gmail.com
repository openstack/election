Hi,

I'm writing this in order to announce my candidacy for Trove PTL during
the Train cycle.

I am not a long time contributor for Trove but I've been contributing to
Openstack for more than 6 years, I've only contributed several patches
to Trove during Stein, mainly for devstack installation improvement and
imporve Trove management network. The reason I touched Trove for recent
half a year is because we have been deploying a private cloud for our
customer and Trove is one of the key cloud services that our customer
demands. After that, we will also deploy Trove in our public cloud. Aa s
result, Trove is one of our long term support cloud services.

However, I found there are several problems during my contribution to
Trove. I'd like to help to solve as most of them as I could if I am
elected as the PTL.

- No one from the current Trove team is actively answering questions in
  the IRC channel, and the review process is a little bit slow. As a
  project without any active contributors, personally I think replying
  promptly to any question related could attract the people who are
  interested in the project, not to mention whose who will potentially
  deploy Trove.
- The default Trove devsatck installation has many restrictions, and the
  devstack installation process is not repeatable which is not friendly
  to the deverlopers. Trove also supports a 'big' script called
  trovestack which include devstack installation, it's convinient, but
  also need to be maintained carefully.
- The nova-network related code is spreaded in the repo, which makes it
  very difficult for new feature implementation and bugfix as well.
  nova-network was deprecated in the OpenStack Newton release, writing
  code that support both Neutron and nova-network is annoying and waste
  the deverloper's time. If we want Trove to continue to be involved, we
  need to remove nova-network related code first.
- Security. This topic has been discussed in the community many times in
  the past few years. Unfortunately, I didn't see any consensus as for
  now. As a public cloud provider, it's a roadblock for us to deploy
  Trove unless the security issue is appropriately solved. One thing I
  can tell is, after removing the nova-network code, it's possible to
  solve(or partially solve) the security issue.

In one word, I care Trove.

Thanks a lot!

Lingxian Kong (lxkong)
