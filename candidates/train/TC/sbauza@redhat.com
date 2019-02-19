Howdy folks,

I wasn't thinking to provide my name for the TC election but unfortunately I
only see a very few proposals that makes me a bit afraid. Given I love
OpenStack and I think the Technical Comittee is more important than my personal
values, I throw my hat now in the ring.

In case you don't know me, I'm Sylvain Bauza (bauzas on IRC), working on
OpenStack since... wow, 6 years already ? In 2013, I was an operator for a SME
company when I wanted to use some cloud for our CI and our developers and I
discovered OpenStack. After 6 months working on it as an operator, I knew it
would be my new life for more than what I know. I moved to another company and
became a developer creating a new project which was named Climate. You probably
know about this project if I tell you the new name : Blazar. Yeah, Blazar is 6
years old too and I'm super happy to see this project be now important with new
companies and developers on it.
After 1 year on it, I changed again my position and became a Nova developer,
eventually becoming nova-core. Time flies and now I'm still there, happy with
what OpenStack became. Of course, it changed. Of course, we have less.
But honestly, I haven't seen more operators using it previously than now, which
means that we succeeded as a team to make OpenStack useful for our users.

I will be honest and say that I now work more on downstream for our customers
than upstream with the Nova community. If you see my upstream involment, it
slowly decreased from the last cycles but don't think I'm out of the band.
After all, that means that people use our code, right? Also, that doesn't
necessarly mean that I'll stop working upstream, it's just a balance that needs
to be challenged, and be sure that if I'm a TC member, I'll take care of this
balance.

Enough words about me. I guess you're more interested in knowing about what I
think is important for a TC membership. Well, I have a few opinions.

 - first, OpenStack is used from startups with a few servers to large cloud
 providers with +200K hosts. That's where we succeeded as projects. I think
 it's very important to make sure that service projects run from 0 to X
 smoothly and make it a priority if not.

 - secondly, the user experience is very important when it comes to talk to
 service projects. Having consistent and versioned APIs is important, albeit
 also client usage. We have microversions in place, but the story isn't fully
 done yet.

 - thirdly, I think we won the complexity game. Deploying OpenStack is now
 smoothier than before, but there are still bumps on the road, and I think
 the TC is the place to arbitrate between the understandable will of having
 more and the reasonable concern about upgrades and deployment concerns.

 Those three items aren't exhaustive of course. We all have opinions and I'm
 just one of the many. By the way, if you read up to here, ask yourself :
 if you care about OpenStack, why wouldn't you propose your name too ?

Thanks,
-Sylvain
