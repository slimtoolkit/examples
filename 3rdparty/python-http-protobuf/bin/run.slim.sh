#!/bin/bash
set -eou pipefail
tag=python-http-protobuf

# build fat and test
docker build ${DOCKER_OPTS:-} -t $tag .
docker run -it --rm $tag

# slimify and test. we use exec instead of cmd to run the tests and exit when they complete
docker-slim build $tag \
            --http-probe=false \
            --show-clogs \
            --cmd "" \
            --exec "python test/test.py"
docker run -it --rm $tag.slim
