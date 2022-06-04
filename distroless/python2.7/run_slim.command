#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="python_app_distroless" -p 9000:9000 my/python-app-distroless.slim

