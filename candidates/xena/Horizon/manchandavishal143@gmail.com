Hi everyone,

I would like to announce my candidacy for PTL of Horizon for Xena release.
I have been actively contributing to Horizon from stein release [1] and become horizon
core reviewer in early train release. During these years, my focus was on filing horizon
feature-gap [2], bug-fixing, and stabilizing horizon and its plugins.

I am very grateful to all the people that have mentored me and helped me throughout
these years. As a PTL I will focus on the following areas:

* Migrate horizon & its plugins to the next LTS version of both Django and Nodejs.

* Focus on specific set of features-gap instead of targeting all or many at a time.
  For example, 'System Scope Support' is one of the highest priority we should do in 
  Xena cycle.

* Reduce the number of New/Open bugs which is high currently. Something we can do weekly
  basis in rotation basis or together in meeting etc.

* Help new contributors to work on the horizon.

I am looking forward to working together with all of you on the Xena release.

Thank you,
Vishal Manchanda(irc: vishalmanchanda)

[1] https://www.stackalytics.io/?metric=commits&release=all&user_id=vishalmanchanda
[2] https://etherpad.opendev.org/p/horizon-feature-gap
