#!/bin/bash
set -e

export ROLE_NAME="nginx"

docker run \
    --rm --privileged \
    -v /lib/modules/:/lib/modules/ \
    -v $(pwd):/etc/ansible/roles/$ROLE_NAME/ \
    indexyz/ansible:$1 \
    -i /etc/ansible/roles/$ROLE_NAME/tests/inventory \
    /etc/ansible/roles/$ROLE_NAME/tests/test.yml -v

