I would like to nominate myself for the TripleO PTL role for the Train cycle.

Having previously served as PTL during the Queens and Rocky cycle, I think we
should focus on the same items as those cycles. We have done excellent work
adding python3 support in TripleO. I would like us to return back to focusing
on simplification and improving the user experience.

* Simplifying the deployment process
  I believe we should spend time looking at what actions we can remove or reduce
  by automating them as part of the deployment process.  Let's figure out
  if we can improve the default installation so that we don't have to specify
  so much.  Additionally I would like to start investigating if we can remove
  some of the services we currently rely on in the undercloud as part of the
  deployment.

* Reducing duplication and tech debt
  Continued cleanup after containerization by fully removing the baremetal
  deployment of services as possible.  Cleaning up logging and error handling
  to improve operators ability to troubleshoot their installations.

Thanks,
Alex Schultz
irc: mwhahaha
