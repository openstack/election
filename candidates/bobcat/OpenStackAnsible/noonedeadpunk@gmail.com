Hello everyone!

I would like to announce my candidacy for the role of PTL of OpenStack-Ansible during
the Bobcat/2023.2 cycle.

I have been serving as the OpenStack PTL for quite a while now so with announcing my candidacy I also want to encourage other active contributors to participate in elections for keeping a healthy community and plurality of opinions in the project leadership.

For the next cycle I would like to focus project development on:
* Implementing SLURP upgrades both in terms of CI testing and upgrade script adjustment
* Continue integration and improvement of PKI role with services
* Keep up with latest supported versions of infrastructure software, like MariaDB, RabbitMQ and Ansible
* Have progress on better functional testing of different scenarios for roles
* Improve timing for our releases by decreasing the gap between OpenStack coordinated release and OSA trailing one.

Thank you for your consideration!
