#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --include-shell --include-exe uname --http-probe my/sample-python-app-standard-shell


