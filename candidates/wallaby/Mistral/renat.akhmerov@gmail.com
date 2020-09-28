Hi,

I'm Renat Akhmerov. I'd like to announce my PTL candidacy for Mistral
in Wallaby cycle.

In Victoria, we made a huge change related to how we manage actions
in Mistral. Previously, all actions were stored in the database and
when any Mistral subsystem needed to get info about an action (action
definition) it sent a query to DB. So, there wasn't any abstraction
responsible for action management. This approach is not flexible and
makes refactoring incredibly hard. It also means that it's nearly
impossible to deliver actions to the system or alter them in runtime
w/o having to reboot a cluster node. In Victoria we introduced the
new abstraction called Action Provider. Action providers are fully
responsible for delivering actions to Mistral. It is possible to 
register many providers in the entry point "mistral.action.providers"
in setup.cfg of any Python project (installed within the same Python
env as Mistral) and Mistral will be using them all to find actions.
So action management is now decoupled from the rest of the system and
it's now possible to move away from storing action definitions only
in the DB. It's fully up to a particular action provider implentation.
Actions can even be dynamically generated, for example, as wrappers
around a subset of operating system commands. Another option is 
requesting info about actions via some communication protocols like
HTTP, AMQP etc.

There's still work to polish this all and document properly but the
main infrastructure is already available and everyone can implement
their own action providers.

For W cycle I'd like to proceed with improving Mistral usability
(toolset for developing Mistral actions, docs etc.) and address
several known scalability issues.

As always, anyone is very welcome to join our project. It's a lot of
fun to work on it.

The best way to get in touch with us is IRC channel #openstack-mistral
or the openstack-discuss mailing list (with [mistral] tag in email
subject).


Cheers

Renat
