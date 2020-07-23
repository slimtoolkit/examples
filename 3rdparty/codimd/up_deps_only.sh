#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
REPO="$( cd -P "$( dirname "$SOURCE" )/repo" && pwd )"

pushd $REPO/deployments
docker-compose up database
popd
