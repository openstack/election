Hello,


I'd like to announce my candidacy for the PTL role in Puppet OpenStack, to
continue my PTL role for the Antelope cycle.

Over the past two cycles, we've successfully improved feature coverage,
platform coverage and simplicity of our modules. I'd like to list up a few
items which would be our priorities during the next cycle.


* Add Ubuntu 22.04 support

This would be the next major change after we've completed implementation of
CentOS 9 Stream support. We already adapted to Ruby 3 as part of C9S support
so I'm not aware of any huge challenges at this moment.


* Complete migration to Puppet 7

Currently our modules still supports both Puppet 6 and 7. However once we
complete migration to Ubuntu 22.04, we complete migration from Ruby 2.x to 3.x.
As Puppet officially supports Ruby 3.x since 7.7, this means we no longer
maintain test coverage with Puppet 6. It's time to consider again complete
migration to Puppet 7.


* Improve scenario/component coverage by CI

During Zed cycle we added OVN and Octavia to the integration jobs. We'll review
a few remaining modules like Manila and will continue extending the component
coverage.


* Review unmaintained/unused modules

In Puppet OpenStack projects we maintain number of modules to support multiple
OpenStack compoents. However, some modules have not been really active and
attracted no interest. In the past few cycles we have retired several modules
but I'd like to continue reviewing our modules to consider retiring inactive
ones.


* Keep each module up to date and simple

It's always important that we add support for the new features/parameters
timely so that users can leverage the new capability via our modules.


Thank you for your consideration.

Thank you,
Takashi
