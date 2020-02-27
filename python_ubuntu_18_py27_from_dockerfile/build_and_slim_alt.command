#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --show-blogs --dockerfile Dockerfile --tag my/python_ubuntu_18_py27_from_dockerfile .





