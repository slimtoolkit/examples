#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --http-probe my/java-app


