#!/bin/bash
set -eou pipefail
tag=python-http-protobuf

# build fat and test
docker build ${DOCKER_OPTS:-} -t $tag .
docker run -it --rm $tag

# slimify and test. we use exec to wait for the tests to finish.
docker-slim build $tag \
            --http-probe=false \
            --show-clogs \
            --exec "sleep 1; while true; do ps -ef | python || break; done"
docker run -it --rm $tag.slim
