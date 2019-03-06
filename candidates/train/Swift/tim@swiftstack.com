I'd like to announce my candidacy for Swift PTL.

Within the Swift community, we have established traditions that ensure
we move carefully, and with purpose. Somewhere out there, there is an
out-of-date-node with data scribbled down in a legacy format that we
must still make durable, or an old client written against a years-old
version of Swift that continues to perform its business-critical
function. By keeping these realities in mind, we have (out of necessity)
featured rolling-upgrades since our first release.

This is not to say that we must therefore move slowly (though we often
do, particularly now that the hype wave has crested, crashed, and begun
to ebb). Despite our conservatism, there are few signs of ossification:
new use-cases and new workloads bring new demands, and Swift evolves to
satisfy them with new features.

We now approach a new transition: John, our long-serving PTL, is
stepping down. I have no worries, however; the Swift community is
accustomed to dealing with (and thinking in terms of) an array of
mostly-independent actors, working to improve the state of the system.
The Swift developers are among the best I've had the pleasure to work
alongside, and I have no doubt that Swift will continue to improve.

I believe the best way I can further that improvement is to serve as PTL;
to listen to users; to engage with operators; to enable developers. We
are working on great, ambitious projects:

* Pete from Red Hat is driving us supporting Python 3. We've known for
  a while  that this would be necessary; it's good to see it finally
  happening.
* Alex and Romain from OVH are upstreaming their (already running in 
  production!) alternate diskfile format to support small objects. 
* Clay at SwiftStack continues to make replication and
  reconstruction better.
* Kazuhiro at NTT is reworking the object-expirer queue, turning it
  into a general task queue.

There is a lot going on in Swift. I can't wait to see what we build.
