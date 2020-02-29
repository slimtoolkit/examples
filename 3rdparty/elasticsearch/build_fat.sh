#!/usr/bin/env bash

set -e

pushd elasticsearch
./gradlew distribution:docker:buildDockerImage
popd
