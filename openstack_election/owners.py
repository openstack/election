# Copyright (c) 2016 OpenStack Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language
# governing permissions and limitations under the License.

# Description: When run using OpenStack's Gerrit server, this builds
# YAML representations of aggregate change owner details and change
# counts for each governance project-team, as well as a combined set
# for all teams.

import csv
import datetime
import os
import sys
import yaml

from openstack_election import utils


def dumper(data, stream):
    """Convenience wrapper to consistently set YAML formatting"""
    return yaml.safe_dump(data, allow_unicode=True, default_flow_style=False,
                          encoding='utf-8', stream=stream)


def normalize_email(email):
    """Normalize email addresses to make it easier to spot duplicates

    Lower-case the domain part of E-mail addresses to better spot
    duplicate entries, since the domain part is case-insensitive
    courtesy of DNS while the local part is not necessarily
    """
    local, domain = email.split('@')
    domain = domain.lower()
    return '%s@%s' % (local, domain)


def normalize_project(project):
    """Normalize project names for consistent failnames

    Replace spaces and hyphens with underscores in project teams
    and then lower-case them, for more convenient filenames
    """
    return project.translate(str.maketrans(' -', '__')).lower()


def date_merged(change, after=None, before=None):
    """Determine the date and time a specific change merged"""

    date = change.get('submitted', None)

    if not date:
        # Something's terribly wrong with any changes matching this now
        print(
            'SKIPPING DATELESS MERGE: change %s for account %s'
            % (change['_number'], change['owner']['_account_id']),
            file=sys.stderr)
        return None

    # Strip superfluous subsecond values as Gerrit always just
    # reports .000000000 for them anyway
    date = date.split('.')[0]

    # Pass back an invalid result if it falls after the requested
    # cutoff
    if before and date >= before:
        return None

    # Sanity check for completeness, but since "after" is also used
    # in the Gerrit query this shouldn't ever actually be reached
    if after and date < after:
        return None

    return date


def main(options):
    """The giant pile of spaghetti which does everything else"""

    # Record the start time for use later
    start = datetime.datetime.utcnow()

    # If we're supplied a configuration file, use it
    if options.config:
        config = yaml.safe_load(open(options.config))
    # Otherwise, use nothing
    else:
        config = {}

    # Start of the match timeframe for change merges
    if options.after:
        after = options.after
    elif 'after' in config:
        after = config['after']
    else:
        after = None

    # End of the match timeframe for change merges
    if options.before:
        before = options.before
    elif 'before' in config:
        before = config['before']
    else:
        before = None

    # Owner Ids for whom to ignore changes
    if options.ignore:
        ignore = [int(i) for i in options.ignore]
    elif 'ignore' in config:
        ignore = config['ignore']
    else:
        ignore = []

    # Legacy projects file path
    if options.legacy:
        legacy_file = options.legacy
    elif 'legacy' in config:
        legacy_file = config['legacy']
    else:
        legacy_file = None

    # SIGs projects file path
    if options.sigs:
        sigs_file = options.sigs
    elif 'sigs' in config:
        sigs_file = config['sigs']
    else:
        sigs_file = None

    # Whether to omit "extra ACs"
    if options.no_extra_acs:
        no_extra_acs = options.no_extra_acs
    elif 'no-extra-acs' in config:
        no_extra_acs = config['no-extra-acs']
    else:
        no_extra_acs = False

    # Output file directory
    if options.outdir:
        outdir = options.outdir
    elif 'outdir' in config:
        outdir = config['outdir']
    else:
        outdir = '.'
    if not os.path.isdir(outdir):
        os.makedirs(outdir)

    # Projects file path
    if options.projects:
        projects_file = options.projects
    elif 'projects' in config:
        projects_file = config['projects']
    else:
        projects_file = None

    # Governance Git repository ref object for reference lists
    if options.ref:
        ref = options.ref
    elif 'ref' in config:
        ref = config['ref']
    else:
        ref = 'branch/master'

    # Gerrit change query additions
    if options.sieve:
        sieve = options.sieve
    elif 'sieve' in config:
        sieve = config['sieve']
    else:
        sieve = None

    # The query identifying relevant changes
    match = 'status:merged'
    if after:
        match = '%s after:"%s"' % (match, after)
    if sieve:
        match = '%s %s' % (match, sieve)

    # Retrieve the governance projects list, needs a Git refname as a
    # parameter
    if projects_file:
        gov_projects = utils.load_yaml(open(projects_file).read())
    else:
        gov_projects = utils.get_from_git('openstack/governance',
                                          '%s/reference/projects.yaml' % ref)

    # The set of retired or removed "legacy" projects from governance
    # are merged into the main dict if their retired-on date falls
    # later than the after parameter for the qualifying time period
    if legacy_file:
        old_projects = utils.load_yaml(open(legacy_file).read())
    elif projects_file:
        old_projects = []
    else:
        old_projects = utils.get_from_git('openstack/governance',
                                          '%s/reference/legacy.yaml' % ref)
    for project in old_projects:
        for deliverable in old_projects[project]['deliverables']:
            retired = old_projects[project]['deliverables'][deliverable].get(
                'retired-on',
                old_projects[project].get('retired-on')
            )
            if retired:
                retired = retired.isoformat()
                if after and after > retired:
                    continue
                if project not in gov_projects:
                    gov_projects[project] = {'deliverables': {}}
                if deliverable in gov_projects[project]['deliverables']:
                    print(('Skipping duplicate/partially retired deliverable:'
                           ' %s') % (deliverable),
                          file=sys.stderr)
                    continue
                gov_projects[project]['deliverables'][deliverable] = \
                    old_projects[project]['deliverables'][deliverable]

    # The set of repositories managed by special interest groups
    # are added to the main dict as they're part of the technical
    # committee electorate
    if sigs_file:
        sigs_repos = utils.load_yaml(open(sigs_file).read())
    elif projects_file:
        sigs_repos = []
    else:
        sigs_repos = utils.get_from_git('openstack/governance',
                                        'reference/sigs-repos.yaml',
                                        {'h': ref})
    for sig in sigs_repos:
        for repo in sigs_repos[sig]:
            if 'sigs' not in gov_projects:
                gov_projects['sigs'] = {'deliverables': {}, 'extra-acs': []}
            if sig not in gov_projects['sigs']['deliverables']:
                gov_projects['sigs']['deliverables'][sig] = {'repos': []}
            gov_projects['sigs']['deliverables'][sig]['repos'].append(
                repo['repo'])
            extra_acs = repo.get('extra-acs', [])
            if extra_acs:
                gov_projects['sigs']['extra-acs'].extend(extra_acs)

    # A cache of full repo names existing in Gerrit, used to filter out repos
    # listed in governance which don't actually exist
    ger_repos = utils.query_gerrit('projects/', verbose=options.verbose)

    # This will be populated with change owners mapped to the
    # project-teams maintaining their respective Git repositories
    projects = {}

    # This will be populated with all change owners and their
    # account details
    owners = {}

    # This will be populated with discovered duplicate owners
    duplicates = {}

    # This will be populated with all individual E-mail addresses of
    # change owners, to facilitate finding and merging duplicate
    # accounts
    all_emails = {}

    # Iterate over all governance project-teams only at filename
    # generation time
    for project in gov_projects:
        # This will be populated with change owner Ids and counts
        projects[project] = {}

        # Governance project-teams have one or more deliverables
        for deliverable in gov_projects[project]['deliverables']:
            # Each deliverable can have multiple repos
            repos = gov_projects[project]['deliverables'][deliverable]['repos']

            # Operate on repo short-names (no namespace) to avoid
            # potential namespace mismatches between governance
            # and Gerrit
            for repo in repos:
                # Only process repos which actually exist in Gerrit,
                # otherwise spew a warning if skipping
                if repo not in ger_repos:
                    print('MISSING: %s' % repo, file=sys.stderr)
                else:
                    # Query for an arbitrary change set and get
                    # detailed account information about the most
                    # recent patchset, paginating at 100 changes
                    offset = 0
                    changes = []
                    while offset >= 0:
                        changes += utils.query_gerrit('changes/', params={
                            'q': 'project:%s %s' % (repo, match),
                            'n': '100',
                            'start': offset,
                            'o': [
                                'CURRENT_COMMIT',
                                'CURRENT_REVISION',
                                'DETAILED_ACCOUNTS',
                                ],
                            }, verbose=options.verbose)
                        if changes and changes[-1].get('_more_changes', False):
                            offset += 100
                        else:
                            offset = -1

                    # Iterate over each matched change in the repo
                    for change in changes:
                        # Get the merge date and skip if it's
                        # outside any requested date range
                        merged = date_merged(change, after, before)
                        if not merged:
                            continue

                        # The change number, for ease of tracking
                        number = change['_number']

                        # How many revisions this change had before merging
                        revisions = list(
                            change['revisions'].values())[0]['_number']

                        # We index owners by their unique Gerrit
                        # account Id numbers
                        owner = change['owner']['_account_id']

                        # If this owner is in the blacklist of Ids
                        # to skip, then move on to the next change
                        if owner in ignore:
                            continue

                        # Seen this owner already?
                        new_owner = owner
                        new = False
                        if owner in duplicates:
                            owner = duplicates[owner]
                        elif owner not in owners:
                            new = True

                        # For new additions, initialize this as
                        # their first and record specific account
                        # details
                        if new:
                            # Get the E-mail address preferred in
                            # Gerrit for this owner's account
                            email = change['owner'].get('email')

                            # If the owner has no preferred address, use the
                            # committer address for the first revision
                            if not email:
                                print(
                                    'ACCOUNT WITHOUT PREFERRED EMAIL: %s'
                                    % owner,
                                    file=sys.stderr)
                                full = utils.query_gerrit('changes/', params={
                                    'q': change['_number'],
                                    'o': [
                                        'ALL_COMMITS',
                                        'ALL_REVISIONS',
                                        'DETAILED_ACCOUNTS',
                                        ],
                                    }, verbose=options.verbose)[0]
                                for rev in full['revisions'].values():
                                    if rev['_number'] == 1:
                                        email = rev[
                                            'commit']['committer']['email']
                                    break

                            # If the E-mail address is not found, skip
                            # since the item cannot be validated any more
                            if email is None:
                                print(
                                    'ACCOUNT PREFERRED EMAIL IS NONE: %s'
                                    % owner, file=sys.stderr)
                                continue

                            # Find duplicate addresses and merge
                            # accounts when that happens
                            address = normalize_email(email)
                            if address in all_emails:
                                owner = all_emails[address]
                                duplicates[new_owner] = owner
                                print(
                                    'MERGING DUPLICATE ACCOUNT: %s into %s'
                                    % (new_owner, owner), file=sys.stderr)
                                continue

                        # For newly found non-duplicate owners,
                        # initialize the global change count,
                        # newest/oldest merged dates, and an empty
                        # list where extra E-mail addresses can be
                        # added; also track their full name and
                        # Gerrit username
                        if new and owner == new_owner:
                            # TODO(fungi): this is a prime candidate
                            # to become a struct, or maybe a class
                            owners[owner] = {
                                'count': 1,
                                'extra': [],
                                'name': change['owner'].get('name'),
                                'newest': merged,
                                'newest_id': number,
                                'oldest': merged,
                                'oldest_id': number,
                                'revisions': revisions,
                                'username': change['owner'].get('username'),
                            }

                        # If we've seen this owner on another change
                        # in any repo then just iterate their global
                        # change counter and update newest/oldest
                        # dates
                        else:
                            owners[owner]['count'] += 1
                            owners[owner]['revisions'] += revisions
                            if merged > owners[owner]['newest']:
                                owners[owner]['newest'] = merged
                                owners[owner]['newest_id'] = number
                            elif merged < owners[owner]['oldest']:
                                owners[owner]['oldest'] = merged
                                owners[owner]['oldest_id'] = number

                        # We only want to add addresses if this is a
                        # new owner or a new duplicate
                        if new:
                            # Normalize the address before
                            # performing any matching since
                            # Gerrit doesn't do a great job of
                            # this on its own
                            address = normalize_email(email)

                            # Track this in the full list of all
                            # known E-mail addresses
                            all_emails[address] = owner

                            # Store the preferred E-mail address
                            # under its own key since it has a
                            # special status, but only if this
                            # is not a duplicate account
                            if owner == new_owner:
                                owners[owner]['preferred'] = email

                                # If this was already added to
                                # the extras list due to an
                                # additional pre-normalized
                                # copy, remove it there
                                if address in owners[owner]['extra']:
                                    owners[owner]['extra'].remove(address)

                            # Store a list of non-preferred
                            # addresses, deduplicating them in
                            # case they match post-normalization
                            # and treating duplicate preferred
                            # addresses as # non-preferred
                            else:
                                if ((address not in owners[owner]['extra'])
                                        and (address != owners[owner].get(
                                            'preferred', ''))):
                                    owners[owner]['extra'].append(address)

                        # If we've seen this owner on another change
                        # in a repo under this project-team then
                        # just iterate their team change counter and
                        # update newest/oldest dates
                        if owner in projects[project]:
                            projects[project][owner]['count'] += 1
                            projects[project][owner]['revisions'] += revisions
                            if merged > projects[project][owner]['newest']:
                                projects[project][owner]['newest'] = merged
                                projects[project][owner]['newest_id'] = number
                            elif merged < projects[project][owner]['oldest']:
                                projects[project][owner]['oldest'] = merged
                                projects[project][owner]['oldest_id'] = number

                        # ...otherwise initialize this as their
                        # first
                        else:
                            # TODO(fungi): another potential struct
                            projects[project][owner] = {
                                'count': 1,
                                'newest': merged,
                                'newest_id': number,
                                'oldest': merged,
                                'oldest_id': number,
                                'revisions': revisions,
                            }

    # The negative counter will be used as a makeshift account Id
    # for non-code contributors; those with owned changes use their
    # Gerrit account Id instead
    counter = 1

    # Use the before time as the only contribution time for non-code
    # contributors, falling back on the script start time if before
    # was not specified
    if before:
        if len(before) == 10:
            stamp = before + ' 00:00:00'
        else:
            stamp = before
    else:
        stamp = start.isoformat(sep=' ').split('.')[0]

    # Iterate over all extra-acs entries
    if not no_extra_acs:
        for project in gov_projects:
            for extra_ac in gov_projects[project].get('extra-acs', []):
                name = extra_ac['name']
                email = extra_ac['email']
                address = normalize_email(email)
                if address in all_emails:
                    owner = all_emails[address]
                else:
                    owner = -counter
                    all_emails[address] = owner
                    owners[owner] = {
                        'count': -1,
                        'extra': [],
                        'name': name,
                        'newest': stamp,
                        'newest_id': 0,
                        'oldest': stamp,
                        'oldest_id': 0,
                        'preferred': address,
                        'revisions': -1,
                        'username': '_non_code_contributor',
                    }
                if owner not in projects[project]:
                    projects[project][owner] = {
                        'count': -1,
                        'newest': stamp,
                        'newest_id': 0,
                        'oldest': stamp,
                        'oldest_id': 0,
                        'revisions': -1,
                    }
                counter += 1

    # This will hold an address list for TC electorate rolls
    electorate = []

    # A table of owners for summit invites
    invites = []

    # A fresh pass through the owners to build some other datasets
    for owner in owners:
        # Sort extra E-mail address lists for ease of comparison
        owners[owner]['extra'].sort()

        # Build the data used for an invite
        if 'name' not in owners[owner] or not owners[owner]['name']:
            print(
                'SKIPPING MALFORMED OWNER: no fullname found for account %s' %
                owner, file=sys.stderr)
            continue
        if 'preferred' not in owners[owner]:
            if 'extra' in owners[owner] and owners[owner]['extra']:
                owners[owner]['preferred'] = owners[owner]['extra'][0]
                owners[owner]['extra'] = owners[owner]['extra'][1:]
                print(
                    'MISSING PREFERRED EMAIL: used first extra address as '
                    'account %s preferred' % owner, file=sys.stderr)
            else:
                print(
                    'SKIPPING MALFORMED OWNER: no preferred or extra '
                    'addresses found for account %s' % owner, file=sys.stderr)
                continue
        # Record OSF member profile ID when it exists
        for email in [owners[owner]['preferred']] + owners[owner]['extra']:
            profile = utils.lookup_member(email, verbose=options.verbose)
            if profile['data']:
                owners[owner]['member'] = profile['data'][0]['id']
                break
        # If not a member, record non-member OSF profile ID when there is one
        if not profile['data']:
            for email in [owners[owner]['preferred']] + owners[owner]['extra']:
                profile = utils.lookup_osf(email, verbose=options.verbose)
                if profile['data']:
                    owners[owner]['nonmember'] = profile['data'][0]['id']
                    break
        # Extract country and affiliations from the OSF profile
        if profile['data']:
            if 'country' in profile['data'][0]:
                owners[owner]['country'] = profile['data'][0]['country']
            if 'affiliations' in profile['data'][0]:
                affiliations = profile['data'][0]['affiliations']
                if affiliations:
                    owners[owner]['affiliations'] = []
                for affiliation in affiliations:
                    if (not affiliation['end_date']
                            or datetime.datetime.fromtmiestamp(
                                affiliation['end_date']) > after):
                        owners[owner]['affiliations'].append(
                            affiliation['organization']['name'])
        invite = [owners[owner].get(
            'member', owners[owner].get('nonmember', 0))]
        invite.append(owners[owner]['name'])
        invite.append(owners[owner]['preferred'])
        invite += owners[owner]['extra']
        invites.append(invite)

        # Append preferred addresses to the TC electorate for members only
        if 'member' in owners[owner] or options.nonmember:
            electorate.append(owners[owner]['preferred'] + '\n')

    # Write out a YAML file covering all change owners
    fd = open(os.path.join(outdir, '_all_owners.yaml'), 'w')
    dumper(owners, stream=fd)
    fd.close()

    # Write out a YAML file covering tracked duplicate accounts
    fd = open(os.path.join(outdir, '_duplicate_owners.yaml'), 'w')
    dumper(duplicates, stream=fd)
    fd.close()

    # Write out a team-specific electoral roll for CIVS
    fd = open(os.path.join(outdir, '_electorate.txt'), 'w')
    fd.writelines(electorate)
    fd.close()

    # Write out a CSV file appropriate for the invite2summit tool
    fd = open(os.path.join(outdir, '_invites.csv'), 'w')
    csv.writer(fd).writerows(invites)
    fd.close()

    # Make another pass through the projects so they can be dumped
    # to our output files
    for project in projects:

        # This will hold team-specific info for writing
        output = {}

        # This will hold an address list for PTL electoral rolls
        electorate = []

        # Use a normalized project name for output file names
        normalized_project = normalize_project(project)

        # Iterate over each change owner for the current team
        for owner in projects[project]:
            # Copy the global owner details into our output since
            # we're going to modify some
            output[owner] = dict(owners[owner])

            # Replace the owner change count and newest/oldest
            # merged dates with the team-specific value rather than
            # using the count from the global set
            for field in (
                    'count', 'newest', 'newest_id', 'oldest', 'oldest_id',
                    'revisions'):
                output[owner][field] = projects[project][owner][field]

            # Append preferred member addresses to the PTL electoral rolls
            if 'member' in owners[owner] or options.nonmember:
                electorate.append(owners[owner]['preferred'] + '\n')

        # Write out a team-specific YAML file
        fd = open(os.path.join(outdir, '%s.yaml' % normalized_project), 'w')
        dumper(output, stream=fd)
        fd.close()

        # Write out a team-specific electoral roll for CIVS
        fd = open(os.path.join(outdir, '%s.txt' % normalized_project), 'w')
        fd.writelines(electorate)
        fd.close()
