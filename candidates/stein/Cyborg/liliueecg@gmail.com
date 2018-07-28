Hi Team,

I'd like to nominate myself for the Cyborg PTL role for the Stein cycle.

Thank you Howard for starting this new project in the community couple year ago. He led the project the beginning and helped the project ramping up on the right track.

Now the project is in a fanatic state after a couple releases preparation. We had our first official release from Q and continues to deliver great features in R and S releases. Our team is growing fast, people are showing interests in the project across different domains from the industry.

We took it in our pride that cyborg is one of the few projects that is grown entirely in the OpenStack community from the very beginning: no vendor code dump, design discussion from scratch, write every bit of code from zero.

I joined the project not too long ago, but I am already so fascinated by being in such a great team and knowing the code we write can help others around the world.

In Rocky, we added further support for FPGAs, e.g. bitstream programming APIs, metadata bitstream standardization. We also finalized Nova-Cyborg interaction spec and start working with Placement folks to make things happen. In addition, we have more device drivers supports (GPUs, Intel/Xilinx FPGAs, etc.)

Looking forward in Stein Cycle, here is a list of things we will try to accomplish:
1. Finish and polish up the interaction with Nova through placement API
2. FInish Implementing os-acc library
3. Complete the E2E flow of doing acc scheduling, initializing, as well as FPGA programming
4. Work with the k8s community to provide containerization support for Kubernetes DPI plugin.
5. Work with Berkely RISC-V team to port their projects over to the OpenStack ecosystem(e.g. FireSim)

Thank you
Regards
Li Liu
