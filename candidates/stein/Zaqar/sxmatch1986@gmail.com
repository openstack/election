Hi all,

It's very pleasure for me that being a Zaqar developer from 2016, and also
being a PTL for Rocky cycle. Today, I'd like to continue serving Zaqar better
as a PTL, if you let me.

We did a great job in Rocky. Supported the different format of client id to be
more suitable for more use cases. We also introduced the function to query
queues filtered by name and metadata in mongodb backend.
For Stein release, I want to finish the list of job below.

1. Refactoring
   We want to remove useless pool group totally in Stein and make the model of
   pool and flavor more clear.

2. Scalability
   We will continue our work to improve Zaqar's performance under the different
   cases of load increasing:
   1) number of publishers
   2) number of subscribers
   3) rate of messages published or consumed
   4) number of messages
   5) number of queues
   6) size of messages

3. Usability
   We still have some works that inherit from Rocky. Those tasks contains very
   useful features:
   1) Introduce an new resource for queue's metadata
   2) Introduce topic resource for notification
   3) Delete message with claim ID
   4) Send Email subscription by Zaqar

It's a fantastic experience working with this amazing team and I would be
pleased to serve as PTL for next cycle and I'd appreciate your vote.

Thanks for your consideration!
