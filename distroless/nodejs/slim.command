#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --expose 8000 --http-probe my/node-app-distroless
