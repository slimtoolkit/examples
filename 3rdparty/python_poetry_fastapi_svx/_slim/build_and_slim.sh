#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _slim.env

slim build --dockerfile Dockerfile --tag-fat dslimexamples/$IMAGE_NAME ${BDIR}${DOCKERFILE_PATH}
popd
