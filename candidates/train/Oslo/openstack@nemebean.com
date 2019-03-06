I am running for Oslo PTL in the Train cycle. I have been Oslo PTL for around a year now, and in that time we've been able to address a number of longstanding user requests, such as the removal of plaintext secrets from config files and a validator for config files.

However, that doesn't mean our job is done. Here are some things I want to focus on for the next cycle:

* Mentor new contributors. In the past cycle we had a number of our most experienced contributors pulled away to other projects, either in part or in total. The good news is we have some newer contributors who I believe can step in to fill those gaps. We need to make sure to help them along as much as possible.

* Support cycle goals. In Stein we were able to add an Oslo library to make the goal implementation easier for all of the other OpenStack projects. We should continue to look for such opportunities with the new cycle goals for Train.

* Storyboard migration. We've been discussing this pretty much since I became PTL, and I know some progress was made in Stein toward addressing some of my concerns with this. I think this is likely to be the cycle where we can go ahead with the move.

* oslo.limit. I still very much want this to be a thing and will do whatever I can to help make it happen.

I think that's it for now, but as always I am open to suggestions on things Oslo can do to make everyone's life easier.
