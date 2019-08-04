#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --show-blogs --from-dockerfile Dockerfile .





