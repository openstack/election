Hi All,

I would like to announce my candidacy for PTL of the Cinder project for
the 2025.1 cycle.

Over the Dalmatian cycle we've continued to improve our codebase with
bug fixes and appropriate deprecations.  We have new drivers in progress
with CI in place.  Security vulnerabilities found in the QCOW2 format
have addressed and backported.  Several drivers have gained new features
and capabilities.

In addition to completing the features planned for this cycle, our
priorities remain close to those at the start of the cycle.  Namely,
focusing on our review backlog, continued migration to the OSC client,
backup encryption and, quite likely, the removal of eventlet to maintain
parity with the other projects.

I appreciate every contributor to our project and am incredibly grateful
for the support that I've had over the 2024.2 cycle.

Thank you for your consideration.

Jon Bernard (jbernard)
