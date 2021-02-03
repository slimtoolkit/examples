#!/bin/bash
set -eou pipefail
tag=python-http-protobuf

# build fast and test
docker build ${DOCKER_OPTS:-} -t $tag .
docker run -it --rm $tag
