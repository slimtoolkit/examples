#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _docker-slim.env

printf "\ncurl http://localhost:1300/$API_PATH\n"
curl http://localhost:1300/$API_PATH
printf "\n\n\n"
popd
