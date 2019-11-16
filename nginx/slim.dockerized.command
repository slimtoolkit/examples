#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock dslim/docker-slim build nginx


