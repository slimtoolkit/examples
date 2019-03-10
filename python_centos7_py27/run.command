#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

#eval "$(docker-machine env default)"
docker run -it --rm --name="python_app_centos" -p 9000:9000 my/sample-python-app-centos7-py27



