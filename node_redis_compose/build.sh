#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker build -t dslimexamples/node-redis-compose-service .



