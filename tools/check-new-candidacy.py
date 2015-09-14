#!/bin/env python

import subprocess
import json


def pread(argv):
    return subprocess.Popen(argv, stdout=subprocess.PIPE).communicate()[0]


def execute(argv):
    return subprocess.Popen(argv).wait()


def get_reviews():
    reviews = pread(["ssh", "-p", "29418", "review.openstack.org", "gerrit",
                     "query", "--format=JSON", "status:open",
                     "project:'openstack/election'"]).split('\n')
    results = []
    for i in reviews:
        if "status" not in i:
            continue
        review = json.loads(i)
        if review['status'] == 'NEW':
            results.append(int(review['number']))
    return results


def check_reviews():
    for review in get_reviews():
        if execute(["git", "review", "-d", "%d" % review]):
            continue
        print
        fl = filter(lambda x: x.startswith("candidates/"),
                    pread(["git", "diff", "--name-only", "HEAD^"]).split('\n'))
        if not len(fl):
            print "[E] No candidacy added"
            continue
        for candidate in fl:
            print "[->] https://review.openstack.org/%d  - %s" % (
                review, candidate)
            execute(["./tools/check-candidacy.py", candidate])
    execute(["git", "checkout", "master"])

if __name__ == "__main__":
    check_reviews()
