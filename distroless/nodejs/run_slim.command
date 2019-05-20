#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="node_app_distroless" -p 8000:8000 my/node-app-distroless.slim

