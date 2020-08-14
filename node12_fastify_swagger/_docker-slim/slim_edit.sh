#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _docker-slim.env

docker-slim build --http-probe-apispec=/spec/yaml --http-probe-cmd=crawl:/spec/static/index.html --new-label new.label=labelx --new-env TEST_ENV_ONE=onex --new-env NEW_ENV_ONE=newone --remove-env TEST_ENV_TWO --remove-label test.label --remove-volume /opt/test.volume/two dslimexamples/$IMAGE_NAME
popd
