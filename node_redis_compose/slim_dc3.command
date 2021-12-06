#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --compose-file node-compose-demo-dc3.yaml --target-compose-svc appsvc
