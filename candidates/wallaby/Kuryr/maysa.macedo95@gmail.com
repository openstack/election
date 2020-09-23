Greetings,

I would like to submit my candidacy to be the PTL of
Kuryr for the Wallaby cycle. I have been a contributor
to Kuryr since the Queens release and was appointed to
the Kuryr core team in the Ussuri cycle.

I see the following goals for the Kuryr project during
the Wallaby cycle:

 * Improve stability and extend CI: we already included
   great improvements in our CI, but I believe we must
   continuously work on it to provide better and quicker
   feedback when developing new features. As part of that,
   we should start graduating experimental jobs like the
   ones using OVN-Octavia driver and Network Policy, and
   handle issues with jobs requiring more swap.
 * Address testing gaps for new and existing features:
   this would avoid regressions and find bugs. Also,
   improves stability.
 * Continue extending and improving Kuryr functionalities,
   such as dual stack, SCTP support and CRDs usage.
 * Grow the contributor base.

I would like to contribute back to the community as a PTL
while following great examples of previous PTLs.

Thank you,

Maysa de Macedo Souza
IRC: maysams
