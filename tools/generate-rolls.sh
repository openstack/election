#!/usr/bin/env bash

CGIT_URL=http://git.openstack.org/cgit/openstack-infra/system-config/plain/tools/owners.py
OWNERS=$(basename "$CGIT_URL")
WITH_STABLE=1

while [ $# -gt 0 ] ; do
    case "$1" in
    --tag)
        TAG=$2
        shift 1
    ;;
    --before)
        BEFORE=$2
        shift 1
    ;;
    --after)
        AFTER=$2
        shift 1
    ;;
    --without-stable)
        WITH_STABLE=0
    ;;
    *)
    ;;
    esac
    shift 1
done

if [ -z "$TAG" ] ; then
    echo $(basename "$0"): You must supply a --tag >&2
    exit 1
fi

if [ -z "$AFTER" ] ; then
    echo $(basename "$0"): You must supply a --after >&2
    exit 1
fi

if [ -z "$BEFORE" ] ; then
    echo $(basename "$0"): You must supply a --before >&2
    exit 1
fi


ROLLS_DIR="./rolls/${TAG}"

echo "Run information:"
echo " - TAG    :" $TAG
echo " - ROLLS  :" $ROLLS_DIR
echo " - STABLE :" $WITH_STABLE
echo " - AFTER  :" $AFTER
echo " - BEFORE :" $BEFORE

rm -rf "${ROLLS_DIR}"
mkdir -p  "${ROLLS_DIR}"

cd $(dirname  "${ROLLS_DIR}")

# Building the venv isn't really needed everytime
if [ ! -d venv ] ; then
    echo "Building tools venv"
    (
    # owners.py isn't python3 safe as string.maketrans is now
    # str.maketrans
    virtualenv -p python2 venv
    ./venv/bin/pip install -U pip setuptools wheel
    ./venv/bin/pip install pyyaml requests ndg-httpsclient
    ) >/dev/null 2>&1
    if [ $? -ne 0 ] ; then
        echo Creating Virtualenv failed >&2
        exit 1
    fi
else
    echo "Using existing venv"
fi

# Always get the newest script in case a bug has been fixed.
rm -f "./${OWNERS}" >/dev/null 2>&1
echo "Grabbing script from: ${CGIT_URL}"
wget "${CGIT_URL}" -O "./${OWNERS}" -o /dev/null
if [ ! -e "./${OWNERS}" ] ; then
    echo Failed to download ${CGIT_URL} >&2
    exit 1
fi

echo "Starting roll generation @" $(TZ=UTC date)
# Exclude the system / bot accounts
# OpenStack Release Bot:
## curl https://review.openstack.org/accounts/22816
# OpenStack Proposal Bot
## curl https://review.openstack.org/accounts/11131
venv/bin/python "./${OWNERS}" -a "${AFTER}" -b "${BEFORE}" \
                              -i 11131 -i 22816 \
                              -o "${TAG}" -r "${TAG}"
if [ "$WITH_STABLE" -eq 1 ] ; then
    TMP_DIR=$(mktemp -d election.XXXXXXX)
    echo "Starting (Stable) roll generation @" $(TZ=UTC date)
    venv/bin/python "./${OWNERS}" -a "${AFTER}" -b "${BEFORE}" \
                                  -i 11131 -i 22816 \
                                  -o "${TMP_DIR}" -r "${TAG}" \
                                  -n -s 'branch:^stable/.*'
    find
    cp "${TMP_DIR}/_electorate.txt"  "./${TAG}/stable_branch_maintenance.txt"
    cp "${TMP_DIR}/_all_owners.yaml" "./${TAG}/stable_branch_maintenance.yaml"
    echo "Finished (Stable) roll generation @" $(TZ=UTC date)
    rm -rf "${TMP_DIR}"
else
    echo Dropping stable_branch_maintenance data
    rm "./${TAG}/stable_branch_maintenance.txt" \
       "./${TAG}/stable_branch_maintenance.yaml"
fi
echo "Finished roll generation @" $(TZ=UTC date)

echo "Electoral rolls SHA256sum"
case "$(uname -s)" in
    Darwin)
        shasum -a 256 ./${TAG}/*.txt | tee "${TAG}.shasums"
    ;;
    *)
        sha256sum ./${TAG}/*.txt | tee "${TAG}.shasums"
    ;;
esac
