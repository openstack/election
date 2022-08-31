Hello, Ironicers and stackers!

I would like to submit my candidacy to continue serving as Ironic PTL
for the Antelope cycle.

During the Zed cycle we focuse in improving stability of our CI,
with the drop of python 3.6 we switched jobs from CS8 to CS9,
removal of networking booting jobs (the support was deprecated last
cycle and removed now in Zed), among other fixes.

The support for syslinux is deprecated now in Zed, meaning that
support for use of pxelinux, virtual media with x86 in Ledacy BIOS
are also deprecated because of the dependency with syslinux.

Let's continue working together to make Ironic reach higher grounds.

Best regards,
Iury Gregory Melo Ferreira

IRC: iurygregory
