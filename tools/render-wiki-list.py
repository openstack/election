#!/usr/bin/env python

import sys
sys.path.append("doc/source/_exts")
from candidates import build_candidates_list

GIT_BASE = 'http://git.openstack.org/cgit/openstack/election/plain/'


def main(argv):
    if len(argv) != 2 or argv[1] not in ("PTL", "TC"):
        print "usage: %s PTL|TC" % argv[0]
        return
    candidates_list = build_candidates_list("mitaka")

    if argv[1] == "PTL":
        candidates_list['projects'].remove('TC')
    else:
        candidates_list['projects'] = ['TC']

    for project in candidates_list['projects']:
        print "* %s" % project
        for candidate in candidates_list['candidates'][project]:
            print "** [%s/%s %s]" % (GIT_BASE,
                                     candidate.replace(' ', '%20'),
                                     candidate.split('/')[-1][:-4])

if __name__ == "__main__":
    main(sys.argv)
