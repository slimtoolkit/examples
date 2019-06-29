#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim --debug build --show-clogs --http-probe my/sample-python-app-u18-user


