#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-compose -f compose.yaml down


