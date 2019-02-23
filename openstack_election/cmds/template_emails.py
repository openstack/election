from __future__ import print_function
from __future__ import unicode_literals

import argparse
import os
import sys

from openstack_election.cmds import render_statistics as stats
from openstack_election import config
from openstack_election import utils

conf = config.load_conf()

REFERENCE_URL = '%s?id=%s' % (utils.PROJECTS_URL, conf['tag'])
LEADERLESS_URL = ('http://governance.openstack.org/resolutions/'
                  '20141128-elections-process-for-leaderless-programs.html')

time_frame = "%(start_str)s - %(end_str)s" % (conf['timeframe'])
start_release, _, end_release = conf['timeframe']['name'].partition('-')

if conf['election_type'] == 'tc':
    tc_fmt_args = dict(
        seats=conf['tc_seats'],
        time_frame=time_frame,
        start_release=start_release,
        end_release=end_release,
        last_release=end_release.lower(),
        start_nominations=utils.get_event('TC Nominations')['start_str'],
        end_nominations=utils.get_event('TC Nominations')['end_str'],
        campaign_start=utils.get_event('TC Campaigning')['start_str'],
        campaign_end=utils.get_event('TC Campaigning')['end_str'],
        election_start=utils.get_event('TC Elections')['start_str'],
        election_end=utils.get_event('TC Elections')['end_str'],
        poll_name='%s TC Election' % (conf['release'].capitalize()),
        reference_url=REFERENCE_URL,
        future_release=end_release.lower(),
        release=conf['release'],
    )
elif conf['election_type'] == 'ptl':
    # NOTE(tonyb): We need an empty item last to ensure the path ends in a
    #              tailing '/'
    stats.collect_project_stats(os.path.join(utils.CANDIDATE_PATH,
                                             conf['release'], ''),
                                False, [])
    ptl_fmt_args = dict(
        nom_end_date=utils.get_event('PTL Nominations')['end_str'],
        time_frame=time_frame,
        starting_release=start_release,
        ending_release=end_release,
        future_release=end_release.lower(),
        email_deadline=conf['timeframe']['email_deadline'],
        num_projects_without_candidates=len(stats.without_candidate),
        election_summary_stats=stats.election_summary(),
        leaderless_url=LEADERLESS_URL,
        projects_no_candidates=len(stats.without_candidate),
        list_projects_no_candidates=", ".join(stats.without_candidate),
        projects_polling=len(stats.need_election),
        list_projects_polling=", ".join(stats.need_election),
        election_end=utils.get_event('PTL Election')['end_str'],
        list_of_elections=", ".join(stats.need_election),
        reference_url=REFERENCE_URL,
    )


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


def ptl_nominations_kickoff():
    email_text = """
Nominations for OpenStack PTLs (Program Team Leads) are now open
and will remain open until %(nom_end_date)s.

All nominations must be submitted as a text file to the
openstack/election repository as explained at
http://governance.openstack.org/election/#how-to-submit-a-candidacy

Please make sure to follow the new candidacy file naming
convention: candidates/<cycle>/<project_name>/<email_address>.

In order to be an eligible candidate (and be allowed to vote) in
a given PTL election, you need to have contributed to the corresponding
team[0] during the %(time_frame)s timeframe (%(starting_release)s to %(ending_release)s). You must also be an OpenStack
Foundation Individual Member in good standing. To check if your membership
is up to date, go to https://www.openstack.org/community/members and
search for your name.

Additional information about the nomination process can be found here:
https://governance.openstack.org/election/

Shortly after election officials approve candidates, they will be listed here:
https://governance.openstack.org/election/#%(future_release)s-ptl-candidates

The electorate is requested to confirm their email address in gerrit[1],
prior to %(email_deadline)s so that the emailed ballots are mailed to the correct email
address. This email address should match that which was provided in your
foundation member profile[2] as well.

Happy running,

[0] https://governance.openstack.org/tc/reference/projects/
[1] https://review.openstack.org/#/settings/contact
[2] https://www.openstack.org/profile/"""  # noqa

    print(email_text % (ptl_fmt_args))


def ptl_nominations_last_days():
    email_text = """
A quick reminder that we are in the last hours for PTL candidate
nominations.

If you want to stand for PTL, don't delay, follow the instructions
at [1] to make sure the community knows your intentions.

Make sure your nomination has been submitted to the openstack/election
repository and approved by election officials.

Election statistics[2]:
%(election_summary_stats)s

This means that with approximately 2 days left, %(num_projects_without_candidates)s projects will
be deemed leaderless.  In this case the TC will oversee PTL selection as
described by [3].

Thank you,

[1] http://governance.openstack.org/election/#how-to-submit-a-candidacy
[2] Any open reviews at
    https://review.openstack.org/#/q/is:open+project:openstack/election
    have not been factored into these stats.
[3] %(leaderless_url)s"""   # noqa

    print(email_text % (ptl_fmt_args))


def ptl_end_nominations():
    email_text = """
The PTL Nomination period is now over. The official candidate list
is available on the election website[0].

There are %(projects_no_candidates)s projects without candidates, so according to this
resolution[1], the TC will have to decide how the following
projects will proceed: %(list_projects_no_candidates)s

There are %(projects_polling)s projects that will have elections: %(list_projects_polling)s. The details
for those will be posted shortly after we setup the CIVS system.

Thank you,

[0] http://governance.openstack.org/election/#%(future_release)s-ptl-candidates
[1] %(leaderless_url)s"""  # noqa

    print(email_text % (ptl_fmt_args))


def ptl_voting_kickoff():
    email_text = """
Polls for PTL elections are now open and will remain open for you to
cast your vote until %(election_end)s.

We are having elections for %(list_of_elections)s.

If you are a Foundation individual member and had a commit in
one of the program's projects[0] over the %(time_frame)s timeframe
(%(starting_release)s to %(ending_release)s) then you are eligible to vote. You should find your
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
http://governance.openstack.org/election/#%(future_release)s-ptl-candidates

Happy voting,

[0] The list of the program projects eligible for electoral status:
    %(reference_url)s

[1] Sign into review.openstack.org:
    Go to Settings > Contact Information.
    Look at the email listed as your Preferred Email.
    That is where the ballot has been sent."""  # noqa

    print(email_text % (ptl_fmt_args))


def ptl_voting_last_days():
    email_text = """
Hello %(list_of_elections)s contributors,

Just a quick reminder that elections are closing soon, if you haven't
already you should use your right to vote and pick your favourite
candidate!

You have until %(election_end)s.

Thanks for your time!"""

    print(email_text % (ptl_fmt_args))


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


def tc_nominations_kickoff():
    email_text = """
Nominations for the Technical Committee positions (%(seats)s positions)
are now open and will remain open until %(end_nominations)s.

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

The election will be held from %(election_start)s through to %(election_end)s. The electorate
are the Foundation individual members that are also committers
for one of the official teams[3] over the %(time_frame)s timeframe (%(start_release)s to
%(end_release)s, as well as the extra-ATCs who are acknowledged by the TC[4].

Please see the website[5] for additional details about this election.
Please find below the timeline:

TC nomination starts   @ %(start_nominations)s
TC nomination ends     @ %(end_nominations)s
TC campaigning starts  @ %(campaign_start)s
TC campaigning ends    @ %(campaign_end)s
TC elections starts    @ %(election_start)s
TC elections ends      @ %(election_end)s

If you have any questions please be sure to either ask them on the
mailing list or to the elections officials[6].

Thank you,

[1] http://governance.openstack.org/election/#how-to-submit-a-candidacy
[2] http://www.openstack.org/community/members/
[3] https://governance.openstack.org/tc/reference/projects/
[4] https://releases.openstack.org/%(last_release)s/schedule.html#p-extra-atcs
[5] https://governance.openstack.org/election/
[6] http://governance.openstack.org/election/#election-officials"""  # noqa

    print(email_text % (tc_fmt_args))


def tc_nominations_last_days():
    email_text = """
A quick reminder that we are in the last hours for TC
candidate announcements. Nominations are open until %(end_nominations)s.

If you want to stand for TC, don't delay, follow the
instructions at [1] to make sure the community knows your
intentions.

Make sure your nomination has been submitted to the
openstack/election repository and approved by election officials.

Thank you,

[1] http://governance.openstack.org/election/#how-to-submit-a-candidacy"""
    print(email_text % (tc_fmt_args))


def tc_end_nominations():
    email_text = """
TC Nomination period is now over. The official candidate list is
available on the election website[0].

Now begins the campaigning period where candidates and
electorate may debate their statements.

Polling will start %(election_start)s.

Thank you,

[0] http://governance.openstack.org/election/#%(release)s-tc-candidates"""

    print(email_text % (tc_fmt_args))


def tc_campaigning_kickoff():
    email_text = """
Developers,
    The TC Election Campaigning Period has now started [1].  During the next
couple days, you are all encouraged to ask the candidates questions about
their platforms [2], opinions on OpenStack, community governance, and anything
else that will help you to better determine how you will vote.  This is the
time to raise any issues you wish the future TC to consider, and to evaluate
the opinions of the nominees prior to their election.

Candidates,
    Each of you has posted a platform [2], and announced your nomination to
the developers.  From this point, you are encouraged to ask each other
questions about the posted platforms, and begin discussion of any points
that you feel are particularly important during the next cycle.  While you
are not yet TC members, your voices and opinions about the issues raised in
your platforms and questions raised by the wider community will help ensure
that the future TC has the widest possible input on the matters of community
concern, and the electorate has the best information to determine the ideal
TC composition to address these and other issues that may arise.

[1] https://governance.openstack.org/election/
[2] http://git.openstack.org/cgit/openstack/election/tree/candidates/%(release)s/TC
"""  # noqa

    print(email_text % (tc_fmt_args))


def tc_voting_kickoff():
    email_text = """
The poll for the TC Election is now open and will remain open until %(election_end)s.

We are selecting %(seats)s TC members, please rank all candidates in
your order of preference.

You are eligible to vote if you are a Foundation individual member[1]
that also has committed to one of the official programs projects[2]
over the %(time_frame)s timeframe (%(start_release)s to %(end_release)s) or if you are one of the
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
[2] %(reference_url)s
[3] Look for the extra-atcs element in [2]
[4] Sign into review.openstack.org: Go to Settings > Contact Information. Look
    at the email listed as your preferred email. That is where the ballot has
    been sent.
[5] http://governance.openstack.org/election/#election-officials
[6] http://governance.openstack.org/election/#%(future_release)s-tc-candidates"""  # noqa

    print(email_text % (tc_fmt_args))


def tc_voting_last_days():
    email_text = """
We are coming down to the last hours for voting in the TC
election. Voting ends %(election_end)s.

Search your gerrit preferred email address[0] for the following subject:
            Poll: %(poll_name)s

That is your ballot and links you to the voting application. Please
vote. If you have voted, please encourage your colleagues to vote.

Candidate statements are linked to the names of all confirmed
candidates:
http://governance.openstack.org/election/#%(future_release)s-tc-candidates

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
[1] %(reference_url)s
[2] http://governance.openstack.org/election/#election-officials"""

    print(email_text % (tc_fmt_args))


def main():
    parser = argparse.ArgumentParser('Tool to generate form emails')
    # Use a sub parser so we can have different template choices based on the
    # election_type
    cmd_parsers = parser.add_subparsers(dest='election_type',
                                        help='Type of election.')
    parser_ptl = cmd_parsers.add_parser('ptl')
    parser_ptl.add_argument('template',
                            choices=['election_season', 'nominations_kickoff',
                                     'nominations_last_days',
                                     'end_nominations',
                                     'voting_kickoff', 'voting_last_days'])
    parser_tc = cmd_parsers.add_parser('tc')
    parser_tc.add_argument('template',
                           choices=['election_season', 'nominations_kickoff',
                                    'nominations_last_days',
                                    'end_nominations',
                                    'campaigning_kickoff',
                                    'voting_kickoff', 'voting_last_days'])

    args = parser.parse_args()
    if not args.election_type:
        parser.print_help(sys.stderr)
        sys.exit(1)

    if args.election_type != conf['election_type']:
        print('Requested %s but repo is currently configured for %s' %
              (args.election_type, conf['election_type']))
        sys.exit(1)

    func_name = '%(election_type)s_%(template)s' % (args.__dict__)
    if func_name in globals():
        func = globals()[func_name]
        if callable(func):
            func()

    return 0
