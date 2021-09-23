#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --target-compose-svc appsvc --compose-file node-compose-demo.yaml


