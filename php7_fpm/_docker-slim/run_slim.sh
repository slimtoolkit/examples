#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _docker-slim.env

docker run -it --rm -p 9000:9000 --name $CONTAINER_NAME dslimexamples/$IMAGE_NAME.slim
popd
