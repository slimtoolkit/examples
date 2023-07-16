#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _slim.env

docker images | grep dslimexamples/$IMAGE_NAME
docker rmi dslimexamples/$IMAGE_NAME
docker rmi dslimexamples/$IMAGE_NAME.slim

popd
