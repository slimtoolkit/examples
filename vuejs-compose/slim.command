#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --target-compose-svc web --compose-file docker-compose.yml --show-clogs


