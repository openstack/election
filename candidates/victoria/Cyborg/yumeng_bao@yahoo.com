Hi Team,

I'd like to announce my candidacy for PTL role of Cyborg for the Victoria cycle.

From Rocky to Ussuri, cyborg has successfully survived and achieved
its three major milestones with the PTLs Zhipeng Huang(Howard) Li Liu
and Sundar Nadathur. Howard started OpenStack acceleration mission
discussion from Telco requirements and formally established OpenStack
Cyborg project as well as the basic infrastructure in Rocky release.
Then during the stein release, with Li as the PTL, we substantially
achieved important progress particularly in refactoring Database schema
and defining clean device object models for future work. In both cycles,
we had several important and illuminating discussions with Nova developers
to define how Cyborg would interact with Nova. In the following train
and ussuri releases, under Sundar's leadership, cyborg has reached an
exciting and significant milestone, where basic cyborg-nova integration
is implemented. That means we finally can manage accelerators and boot
instances with accelerators.

I would like to thank from the bottom of my heart to all the cyborg
sponsors, PTLs and core reviewers(both current and ex) who have contributed
patchsets, implement key features, and help improve cyborg architecture.
I also want to thank thoes who have helped cyborg in many other ways
like promoting cyborg in other opensource communities or conferences,
writing blogs, using it and give feedback, etc. It's too hard to list
them all. Thank you all for creating cyborg!

As we move forward, there is still potential in Cyborg. Here are the
items that in my mind to accomplish in the Victoria cycle:

* Complement cyborgclient especially those related to the new V2 API
* Implement policy check for all APIs
* High-priority functional code refactoring like handle placement
  exception when cyborg report data to placement, patch arq from
  conductor etc
* Improve Nova-integration to support more like hotplug,resize,migration
* Implement tempest for new cases
* Improve docs including api-ref, user-doc etc
* Other Possible tasks like new driver support are also welcome

Thanks.
Yumeng Bao
