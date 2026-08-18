Hereby I'm submitting my candidacy for the OpenStack Technical Committee.

Why I'm running
My focus over the last cycles has been proving, that OpenStack's core services
can be modernized without sacrificing API compatibility or operational trust.
That work has two halves, and I think both are relevant to what the TC needs
right now:

Technical proof of concept - keystone-rs (keystone-NG). With a team of
like-minded people I've been building a Rust reimplementation of Keystone,
OpenStack's identity service, treating it as a real-world test of whether a
modern systems language can slot into the existing OpenStack API surface.
This isn't a toy rewrite: it implements what we have now, just safer, and adds
long requested features which we were not able to deliver with the current
software architecture. I've driven the architecture decision records for this
work through security review, building out the API test infrastructure needed
to prove compatibility claims rather than assert them.

Governance proof of process - the Rust-as-supported-language resolution.
In parallel, I drafted a formal TC resolution proposing Rust as an officially
supported implementation language for OpenStack services. Getting that
resolution to a state the community could evaluate honestly meant walking back
marketing language, correcting inaccurate SOC2/PCI-DSS regulatory claims,
fixing a conflated GIL/memory-pressure argument, and grounding the compliance
rationale in what CISA and the EU Cyber Resilience Act actually say.

What I want to work on if elected
Turning the Rust-as-supported-language resolution's lessons into a repeatable
framework for evaluating future "modernize a core service" proposals, so each
one doesn't have to relitigate the same compliance and compatibility questions
from scratch. Using keystone-rs as a template for what evidence the TC should
expect from any team proposing to reimplement or significantly re-architect a
core service - API test coverage, explicit compatibility guarantees, and
security/architecture review as a gate, not an afterthought.
Helping the TC set expectations for how OpenStack engages with newer
compliance regimes (EU CRA in particular) without overstating what any given
implementation choice actually buys the project.

OpenInfra Profile: https://openinfra.org/a/community/members/101132
