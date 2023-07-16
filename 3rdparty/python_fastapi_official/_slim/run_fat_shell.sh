#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _slim.env

docker run -it --rm --security-opt seccomp=unconfined -p 1300:1300 --entrypoint $SHELL_NAME dslimexamples/$IMAGE_NAME
popd
