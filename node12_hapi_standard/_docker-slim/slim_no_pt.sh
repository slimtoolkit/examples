#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _docker-slim.env

docker-slim --log-level=trace build --copy-meta-artifacts . --rta-source-ptrace=false dslimexamples/$IMAGE_NAME
popd
