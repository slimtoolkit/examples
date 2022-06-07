#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here/..

docker-slim build --compose-file compose-dc3.yaml --target-compose-svc appsvc
