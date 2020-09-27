I'm writing this in order to announce my candidacy for Trove PTL during
the Wallaby development cycle.

I started my PTL responsibility from Train and I'd like to continue to
improve and maintain this project.

During Victoria, Trove has achieved significant improvement, include:

* Container deployment for database service inside trove guest instance, so
  that Trove team doesn't need to maintain multiple datastore images.
* The database backup and restore operations are performed by docker container
  inside the trove instance.
* Added trove instance rebuild in order to support trove upgrade agent upgrade.
* Resizing action enhancement.

In Wallaby, I will keep improving Trove for production usage.

Lingxian Kong (lxkong)
