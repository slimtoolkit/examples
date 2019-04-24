#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="python_app_st_shell" -p 9000:9000 my/sample-python-app-standard-shell



