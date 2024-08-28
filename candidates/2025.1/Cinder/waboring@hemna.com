Hello,
  
  I am submitting my name for Cinder PTL for the 2025.1 release.

  I have been a member of the cinder community since 2012 and a 
cinder core since 2013.  I was the initial author of the os-brick
library and a major contributor to the design of the Fiber Channel
zone manager that was implemented back in 2014.  I have also created
the HP 3PAR drivers, the HP client library that the 3PAR drivers use.
I also created the ceph-iscsi volume driver and it's client library,
the rbd-iscsi-client.

  The last few years I have been working at SAP as the owner of SAP's
cinder deployments for the SAP Converged Cloud which is running under
multiple kubernetes deployemnts around the world.  I believe having 
real world daily ownership of complex deployment of cinder would 
provide valuable experience to the community as PTL.


Walter A. Boring IV (hemna)
