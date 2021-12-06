#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --continue-after enter --compose-file node-compose-demo.yaml --target-compose-svc appsvc --show-clogs
