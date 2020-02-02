#!/usr/bin/env bash

set -e

pushd ubuntu.com
DOCKER_BUILDKIT=1 docker build --tag ubuntu-com .
popd
