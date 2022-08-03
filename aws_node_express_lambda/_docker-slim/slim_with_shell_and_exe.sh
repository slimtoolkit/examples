#!/usr/bin/env bash

set -euo pipefail

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
CDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd ${BDIR}
source _app.env
source _docker-slim.env

printf "SLIM IMAGE [START]\n"

printf "BDIR: ${BDIR}\n"
printf "CDIR: ${CDIR}\n"
printf "GIT_REVISION: ${GIT_REVISION}\n"
printf "AWS_ACCOUNT: ${AWS_ACCOUNT}\n"
printf "AWS_REGION: ${AWS_REGION}\n"

[[ -z "${GIT_REVISION:-}" ]] && { echo "GIT_REVISION is not set"; exit 1; }
[[ -z "${AWS_ACCOUNT:-}" ]] && { echo "AWS_ACCOUNT is not set"; exit 1; }
[[ -z "${AWS_REGION:-}" ]] && { echo "AWS_REGION is not set"; exit 1; }

SERVER_IMAGE_BASE_NAME=aws-node-express-api
IMAGE_NAME=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/${SERVER_IMAGE_BASE_NAME}
printf "Slimming container image - ${IMAGE_NAME}:${GIT_REVISION}\n"

docker-slim build --http-probe-cmd-file custom-probe.json --include-shell --include-path-file includefile --include-exe uname ${IMAGE_NAME}:${GIT_REVISION}

printf "SLIM IMAGE LOCAL [DONE]\n"
popd

