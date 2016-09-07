#!/usr/bin/env python

import sys
sys.path.append("doc/source/_exts")
from candidates import build_candidates_list  # noqa: E402

GIT_BASE = 'http://git.openstack.org/cgit/openstack/election/plain/'


def main(argv):
    if len(argv) != 2 or argv[1] not in ("PTL", "TC"):
        print "usage: %s PTL|TC" % argv[0]
        return
    candidates_list = build_candidates_list("newton")

    if argv[1] == "PTL":
        if 'TC' in candidates_list['projects']:
            candidates_list['projects'].remove('TC')
    else:
        candidates_list['projects'] = ['TC']

    for project in candidates_list['projects']:
        print "* %s" % project.replace('_', ' ')
        for candidate in candidates_list['candidates'][project]:
            candidate_name = candidate.split('/')[-1][:-4].replace('_', ' ')
            candidate_name = candidate_name.title()
            print "** [%s/%s %s]" % (GIT_BASE,
                                     candidate.replace(' ', '%20'),
                                     candidate_name)

if __name__ == "__main__":
    main(sys.argv)
