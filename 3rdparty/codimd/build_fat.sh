#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
REPO="$( cd -P "$( dirname "$SOURCE" )/repo" && pwd )"

pushd $REPO/deployments

docker build --build-arg RUNTIME=hackmdio/runtime:node-10-d27854ef -t dslimexamples/codimd -f Dockerfile "$REPO"

popd
