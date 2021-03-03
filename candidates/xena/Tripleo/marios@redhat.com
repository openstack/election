Hello

I would like to continue serving as PTL for TripleO during the Xena cycle.
Wallaby was my first PTL experience and it has been challenging and
rewarding. I've learnt a lot about release processes and other repo related
admin (like moving projects to the Independent release cycle).

As I said in the W candidacy nomination [1], nowadays TripleO works in
self-contained squads that drive technical decisions. We've had a lot of work
across these squads (as always) during W with progress in a number of areas
including moving port/network creation outside of Heat (ports v2),
tripleo-ceph/tripleo-ceph-client and switching out ceph-ansible for cephadm,
removing swift and the deployment plan, BGP support with frrouter and using
ephemeral Heat for the overcloud deployment.

I'd like to continue what i started in W, which is, to increase socialisation
across tripleo squads and try to reign in the multitude of repos that we have
created (and some now abandoned) over the years.

After a well attended Wallaby PTG we have reinstated our traditional IRC
meetings in #tripleo. I've started to "tidy up" our repos, moving some of the
older and no longer used projects to 'independent' (os-refresh-config and
friends, tripleo-ipsec) and started the process to mark older branches as EOL,
starting with Rocky. There is a lot more to do here and I will be happy to do
it if you give me the opportunity,

thanks for your consideration,

marios

[1] https://opendev.org/openstack/election/raw/branch/master/candidates/wallaby/Tripleo/marios%40redhat.com
