Hello everyone,

I would like to announce my candidacy for PTL of the OpenStack Trove
project for the 2026.2 cycle.

I have been actively working with the Trove codebase for more than
two years as part of my company's team. We operate Trove in
production as a core component of our DBaaS platform, which has given 
us strong hands-on experience with real workloads, operational 
challenges, and long-term maintenance. This production background 
allows me to bring practical feedback and stability-focused 
improvements to the community.

During this time, we have identified and fixed multiple issues in
reliability, security, and operational workflows. We are currently
contributing these fixes upstream and remain committed to
strengthening Trove’s stability and usability.

If elected as PTL, my primary focus will be on project
sustainability, operational maturity, and community growth.

Key priorities for the 2026.2 cycle:
- Continue improving stability and reliability by merging pending bug
  fixes and strengthening testing and CI coverage
- Enhance security, including SSL/TLS lifecycle management for
  database services, leveraging Barbican for secret and certificate
  storage
- Improve operational tooling, observability, and troubleshooting
  capabilities
- Strengthen documentation and deployment workflows to lower the
  entry barrier for operators and new contributors
- Support contributors and help align efforts toward common
  priorities

Longer-term direction:
- Expand the ecosystem of supported managers based on community
  demand and operational feasibility, including KeyDB, Kafka,
  ClickHouse, MongoDB, and others

Continue evolving Trove toward modern cloud-native environments while
maintaining backward compatibility and production readiness.

I believe Trove’s key strength is its flexibility and integration
within the OpenStack ecosystem. My goal is to ensure that the project
remains stable, secure, and relevant for both existing and new users.

Thank you for your time and consideration.

Erkin Mussurmankulov