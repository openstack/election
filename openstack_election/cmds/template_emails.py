
import argparse
import jinja2
import os
import sys

from openstack_election.cmds import render_statistics as stats
from openstack_election import config
from openstack_election import utils

conf = config.load_conf()

REFERENCE_URL = utils.PROJECTS_URL.replace(
        'raw', 'src') % '/'.join(('tag', conf['tag']))
LEADERLESS_URL = ('https://governance.openstack.org/resolutions/'
                  '20141128-elections-process-for-leaderless-programs.html')

time_frame = "%(start_str)s - %(end_str)s" % (conf['timeframe'])
start_release, _, end_release = conf['timeframe']['name'].partition('-')

template_names = ['election_season', 'nominations_kickoff',
                  'nominations_last_days', 'end_nominations',
                  'voting_kickoff', 'voting_last_days']
fmt_args = dict(
    email_deadline=conf['timeframe']['email_deadline'],
    end_release=end_release,
    last_release=end_release.lower(),
    leaderless_url=LEADERLESS_URL,
    reference_url=REFERENCE_URL,
    release=conf['release'],
    seats=conf['tc_seats'],
    start_release=start_release,
    time_frame=time_frame,
)

election_type = utils.conf.get('election_type', '').lower()
if election_type in ['tc', 'combined']:
    fmt_args.update(dict(
        start_nominations=utils.get_event('TC Nominations')['start_str'],
        end_nominations=utils.get_event('TC Nominations')['end_str'],
        campaign_start=utils.get_event('TC Campaigning')['start_str'],
        campaign_end=utils.get_event('TC Campaigning')['end_str'],
        election_start=utils.get_event('TC Election')['start_str'],
        election_end=utils.get_event('TC Election')['end_str'],
        poll_name='OpenStack %s Cycle Technical Committee Election Poll' % (
            conf['release']),
    ))
    template_names += ['campaigning_kickoff']

# NOTE(tonyb): In the case of a "combined" election we assume that the dates
# for each "phase" (nominations, campaigning or elections) overlap so updating
# the end_nominations key here with the PTL date should be safe
if election_type in ['ptl', 'combined']:
    # NOTE(tonyb): We need an empty item last to ensure the path ends in a
    #              tailing '/'
    stats.collect_project_stats(os.path.join(utils.CANDIDATE_PATH,
                                             conf['release'], ''),
                                False, [])
    fmt_args.update(dict(
        end_nominations=utils.get_event('PTL Nominations')['end_str'],
        election_summary_stats=stats.election_summary(),
        leaderless_count=len(stats.without_candidate),
        list_of_leaderless_projects=", ".join(stats.without_candidate),
        election_count=len(stats.need_election),
        election_end=utils.get_event('PTL Election')['end_str'],
        list_of_elections=", ".join(stats.need_election),
    ))


def main():
    parser = argparse.ArgumentParser('Tool to generate form emails')
    parser.add_argument('template', choices=template_names)

    args = parser.parse_args()
    func_name = ('%(election_type)s_%(template)s' %
                 (dict(election_type=conf['election_type'],
                       template=args.template)))
    env = jinja2.Environment(
        loader=jinja2.PackageLoader('openstack_election', 'templates'),
        autoescape=jinja2.select_autoescape(['html', 'xml'])
    )
    try:
        template = env.get_template('%s.j2' % func_name)
        print(template.render(fmt_args))
    except jinja2.exceptions.TemplateNotFound:
        print('\nNo %s.j2 template found.\n' % func_name, file=sys.stderr)
        return 1

    return 0
