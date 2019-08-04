#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm -p 5000:5000 my/python_ubuntu_18_py27_from_dockerfile



