#!/bin/sh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

# <<"COMMENT"
docker run \
    -p 53590:53589 \
    -d \
    --restart unless-stopped \
    -v ${SCRIPTPATH}/certs:/var/taskd_certs:ro \
    -v ${SCRIPTPATH}/data:/var/taskd:rw \
    --name taskd \
    taskw
# COMMENT

# when developing
<<"COMMENT"
docker run \
    -p 53590:53589 \
    -it \
    --rm \
    -v ${SCRIPTPATH}/certs:/var/taskd_certs:ro \
    -v ${SCRIPTPATH}/data:/var/taskd:rw \
    --name taskd \
    taskw
COMMENT
