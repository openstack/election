from __future__ import print_function
from __future__ import unicode_literals

from openstack_elections import config
from openstack_elections import utils

conf = config.load_config()

REFERENCE_URL = '%s?id=%s' (utils.PROJECTS_URL, conf['tag'])
LEADERLESS_URL = ('http://governance.openstack.org/resolutions/'
                  '20141128-elections-process-for-leaderless-programs.html')


def ptl_election_season():
    email_text = """
Election details: https://governance.openstack.org/election/

Please read the stipulations and timelines for candidates and
electorate contained in this governance documentation.

Please note, if only one candidate is nominated as PTL for a program
during the PTL nomination period, that candidate will win by acclaim,
and there will be no poll. There will only be a poll if there is more
than one candidate stepping forward for a program's PTL position.

There will be further announcements posted to the mailing list as
action is required from the electorate or candidates. This email
is for information purposes only.

If you have any questions which you feel affect others please reply
to this email thread.

If you have any questions that you which to discuss in private please
email any of the election officials[1] so that we may address your
concerns.

Thank you,

[1] https://governance.openstack.org/election/#election-officials"""

    print(email_text)


def ptl_nominations_kickoff(nom_end_date, time_frame, starting_release,
                            ending_release, future_release, email_deadline):
    email_text = """
Nominations for OpenStack PTLs (Program Team Leads) are now open
and will remain open until %s.

All nominations must be submitted as a text file to the
openstack/election repository as explained at
http://governance.openstack.org/election/#how-to-submit-your-candidacy

Please make sure to follow the new candidacy file naming
convention: candidates/<cycle>/<project_name>/<email_address>.

In order to be an eligible candidate (and be allowed to vote) in
a given PTL election, you need to have contributed to the corresponding
team[0] during the %s timeframe (%s to %s). You must also be an OpenStack
Foundation Individual Member in good standing. To check if your membership
is up to date, go to https://www.openstack.org/community/members and
search for your name.

Additional information about the nomination process can be found here:
https://governance.openstack.org/election/

Shortly after election officials approve candidates, they will be listed here:
https://governance.openstack.org/election/#%s-ptl-candidates

The electorate is requested to confirm their email address in gerrit[1],
prior to %s so that the emailed ballots are mailed to the correct email
address. This email address should match that which was provided in your
foundation member profile[2] as well.

Happy running,

[0] https://governance.openstack.org/tc/reference/projects/
[1] https://review.openstack.org/#/settings/contact
[2] https://www.openstack.org/profile/"""

    print(email_text % (nom_end_date,
                        time_frame,
                        starting_release,
                        ending_release,
                        future_release,
                        email_deadline))


def ptl_nominations_last_days(num_projects_without_candidates):
    email_text = """
A quick reminder that we are in the last hours for PTL candidate
nominations.

If you want to stand for PTL, don't delay, follow the instructions
at [1] to make sure the community knows your intentions.

Make sure your nomination has been submitted to the openstack/election
repository and approved by election officials.

Election statistics[2]:

This means that with approximately 2 days left, %s projects will
be deemed leaderless.  In this case the TC will oversee PTL selection as
described by [3].

Thank you,

[1] http://governance.openstack.org/election/#how-to-submit-your-candidacy
[2] Assuming the open reviews below are validated
    https://review.openstack.org/#/q/is:open+project:openstack/election
[3] %s"""

    print(email_text % (num_projects_without_candidates, LEADERLESS_URL))


def ptl_end_nominations(projects_no_candidates,
                        list_projects_no_candidates, projects_polling,
                        list_projects_polling, future_release):
    email_text = """
The PTL Nomination period is now over. The official candidate list
is available on the election website[0].

There are %s projects without candidates, so according to this
resolution[1], the TC will have to decide how the following
projects will proceed: %s

There are %s projects that will have elections: %s. The details
for those will be posted shortly after we setup the CIVS system.

Thank you,

[0] http://governance.openstack.org/election/#%s-ptl-candidates
[1] %s"""

    print(email_text % (projects_no_candidates,
                        list_projects_no_candidates,
                        projects_polling,
                        list_projects_polling,
                        future_release,
                        LEADERLESS_URL))


def ptl_voting_kickoff(election_end, list_of_elections, time_frame,
                       starting_release, ending_release, future_release):
    email_text = """
Polls for PTL elections are now open and will remain open for you to
cast your vote until %s.

We are having elections for %s.

If you are a Foundation individual member and had a commit in
one of the program's projects[0] over the %s timeframe
(%s to %s) then you are eligible to vote. You should find your
email with a link to the Condorcet page to cast your vote in the
inbox of your gerrit preferred email[1].

What to do if you don't see the email and have a commit in at
least one of the programs having an election:
* check the trash or spam folders of your gerrit Preferred
    Email address, in case it went into trash or spam
* wait a bit and check again, in case your email server is a bit slow
* find the sha of at least one commit from the program
    project repos[0] and email the election officials.

If we can confirm that you are entitled to vote, we will add you
to the voters list for the appropriate election.

Our democratic process is important to the health of OpenStack,
please exercise your right to vote!

Candidate statements/platforms can be found linked to Candidate
names on this page:
http://governance.openstack.org/election/#%s-ptl-candidates

Happy voting,

[0] The list of the program projects eligible for electoral status:
    %s

[1] Sign into review.openstack.org:
    Go to Settings > Contact Information.
    Look at the email listed as your Preferred Email.
    That is where the ballot has been sent."""

    print(email_text % (election_end,
                        list_of_elections,
                        time_frame,
                        starting_release,
                        ending_release,
                        future_release,
                        REFERENCE_URL))


def ptl_voting_last_days(list_of_elections, election_end):
    email_text = """
Hello %s contributors,

Just a quick reminder that elections are closing soon, if you haven't
already you should use your right to vote and pick your favourite
candidate!

You have until %s.

Thanks for your time!"""

    print(email_text % (list_of_elections,
                        election_end))


def tc_election_season():
    email_text = """
Election details: https://governance.openstack.org/election/

Please read the stipulations and timelines for candidates and
electorate contained in this governance documentation.

There will be further announcements posted to the mailing list as
action is required from the electorate or candidates. This email
is for information purposes only.

If you have any questions which you feel affect others please reply
to this email thread.

If you have any questions that you which to discuss in private please
email any of the election officials[1] so that we may address your
concerns.

Thank you,

[1] https://governance.openstack.org/election/#election-officials"""

    print(email_text)


def tc_nominations_kickoff(seats, end_nominations, voting_start,
                           voting_end, time_frame, start_release,
                           end_release, start_nominations, end_nomination,
                           campaign_start, campaign_end, election_start,
                           election_end, future_release):
    email_text = """
Nominations for the Technical Committee positions (%s positions)
are now open and will remain open until %s.

All nominations must be submitted as a text file to the
openstack/election repository as explained on the election website[1].

Please note that the name of the file should match an email
address in the foundation member profile of the candidate.

Also for TC candidates election officials refer to the community
member profiles at [2] please take this opportunity to ensure that
your profile contains current information.

Candidates for the Technical Committee Positions: Any Foundation
individual member can propose their candidacy for an available,
directly-elected TC seat.

The election will be held from %s through to %s. The electorate
are the Foundation individual members that are also committers
for one of the official teams[3] over the %s timeframe (%s to
%s, as well as the extra-ATCs who are acknowledged by the TC[4].

Please see the website[5] for additional details about this election.
Please find below the timeline:

TC nomination starts   @ %s
TC nomination ends     @ %s
TC campaigning starts  @ %s
TC campaigning ends    @ %s
TC elections starts    @ %s
TC elections ends      @ %s

If you have any questions please be sure to either ask them on the
mailing list or to the elections officials[6].

Thank you,

[1] http://governance.openstack.org/election/#how-to-submit-your-candidacy
[2] http://www.openstack.org/community/members/
[3] https://governance.openstack.org/tc/reference/projects/
[4] https://releases.openstack.org/%s/schedule.html#p-extra-atcs
[5] https://governance.openstack.org/election/
[6] http://governance.openstack.org/election/#election-officials"""

    print(email_text % (seats,
                        end_nominations,
                        voting_start,
                        voting_end,
                        time_frame,
                        start_release,
                        end_release,
                        start_nominations,
                        end_nomination,
                        campaign_start,
                        campaign_end,
                        election_start,
                        election_end,
                        future_release))


def tc_nominations_last_days(end_nominations):
    email_text = """
A quick reminder that we are in the last hours for TC
candidate announcements. Nominations are open until %s.

If you want to stand for TC, don't delay, follow the
instructions at [1] to make sure the community knows your
intentions.

Make sure your nomination has been submitted to the
openstack/election repository and approved by election officials.

Thank you,

[1] http://governance.openstack.org/election/#how-to-submit-your-candidacy"""

    print(email_text % (end_nominations))


def tc_end_nominations(future_release, election_start_day):
    email_text = """
TC Nomination period is now over. The official candidate list is
available on the election website[0].

Now begins the campaigning period where candidates and
electorate may debate their statements.

Polling will start %s.

Thank you,

[0] http://governance.openstack.org/election/#%s-tc-candidates"""

    print(email_text % (future_release, election_start_day))


def tc_voting_kickoff(poll_end, seats, time_frame, start_release,
                      end_release, future_release):
    email_text = """
The poll for the TC Election is now open and will remain open until %s.

We are selecting %s TC members, please rank all candidates in
your order of preference.

You are eligible to vote if you are a Foundation individual member[1]
that also has committed to one of the official programs projects[2]
over the %s timeframe (%s to %s) or if you are one of the
extra-atcs.[3]

What to do if you don't see the email and have a commit in at least
one of the official programs projects[2]:
* check the trash or spam folder of your gerrit Preferred Email
address[4], in case it went into trash or spam
* wait a bit and check again, in case your email server is a bit slow
* find the sha of at least one commit from the program project
repos[2] and email the election officials[1].

If we can confirm that you are entitled to vote, we will
add you to the voters list and you will be emailed a ballot.

Our democratic process is important to the health of OpenStack,
please exercise your right to vote.

Candidate statements/platforms can be found linked to Candidate
names[6].

Happy voting!

Thank you,

[1] http://www.openstack.org/community/members/
[2] %s
[3] Look for the extra-atcs element in [2]
[4] Sign into review.openstack.org: Go to Settings > Contact Information. Look
    at the email listed as your preferred email. That is where the ballot has
    been sent.
[5] http://governance.openstack.org/election/#election-officials
[6] http://governance.openstack.org/election/#%s-tc-candidates"""

    print(email_text % (poll_end,
                        seats,
                        time_frame,
                        start_release,
                        end_release,
                        REFERENCE_URL,
                        future_release))


def tc_voting_last_days(poll_end, poll_name, future_release):

    email_text = """
We are coming down to the last hours for voting in the TC
election. Voting ends %s.

Search your gerrit preferred email address[0] for the following subject:
            Poll: %s

That is your ballot and links you to the voting application. Please
vote. If you have voted, please encourage your colleagues to vote.

Candidate statements are linked to the names of all confirmed
candidates:
http://governance.openstack.org/election/#%s-tc-candidates

What to do if you don't see the email and have a commit in at least
one of the official programs projects[1]:
* check the trash of your gerrit Preferred Email address[0], in
    case it went into trash or spam
* wait a bit and check again, in case your email server is a bit slow
* find the sha of at least one commit from the program project
    repos[1] and email the election officials[2].

If we can confirm that you are entitled to vote, we will add you
to the voters list and you will be emailed a ballot.

Please vote!

Thank you,

[0] Sign into review.openstack.org: Go to Settings > Contact
    Information. Look at the email listed as your Preferred Email.
    That is where the ballot has been sent.
[1] %s
[2] http://governance.openstack.org/election/#election-officials"""

    print(email_text % (poll_end, poll_name, future_release, REFERENCE_URL))
