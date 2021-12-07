#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-compose -f docker-compose.slim_all.yaml up



