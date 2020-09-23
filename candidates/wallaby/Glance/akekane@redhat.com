Hi All,

I would like to nominate myself for the Glance PTL role for the Wallaby cycle.

Over the past couple of years we've had a small team looking after Glance
and planned the priorities accordingly. During Victoria cycle we managed to
stabilize ``Import image in multiple stores`` and ``Copy existing images in
multiple stores`` features also were able to add a couple of important features
related handling sparseness while uploading images, support for configuring
multiple cinder stores, performance improvement for RBD chunked upload,
and fixed some important bugs.

There is as always a lot of exciting work coming in the Wallaby including
the continued exploration of features related to Edge computing, cluster
awareness of glance, Moving current cache-manage utility under Cache API,
image encryption support, adding CI jobs for each driver supported by
glance-store library, adding missing tempest tests etc. I'm sure many more
that we will discuss at the coming Wallaby PTG. Two areas
I would like to focus on as PTL should you give me the opportunity are:

  - improve our current documentation/deployment guides
  - drive key priorities, maintain production stability
  - remove deprecated options and address TODO comments in code
  - improve visibility among cross projects, mainly tempest and horizon

Thank you for taking my self nomination into consideration,
Abhishek Kekane (abhishekk)
