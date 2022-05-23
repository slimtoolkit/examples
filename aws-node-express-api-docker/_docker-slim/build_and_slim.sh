#!/usr/bin/env bash

set -euo pipefail

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
CDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd ${BDIR}
source _app.env

printf "BUILD IMAGE [START]\n"

printf "BDIR: ${BDIR}\n"
printf "CDIR: ${CDIR}\n"
printf "GIT_REVISION: ${GIT_REVISION}\n"
printf "AWS_ACCOUNT: ${AWS_ACCOUNT}\n"
printf "AWS_REGION: ${AWS_REGION}\n"

[[ -z "${GIT_REVISION:-}" ]] && { echo "GIT_REVISION is not set"; exit 1; }
[[ -z "${AWS_ACCOUNT:-}" ]] && { echo "AWS_ACCOUNT is not set"; exit 1; }
[[ -z "${AWS_REGION:-}" ]] && { echo "AWS_REGION is not set"; exit 1; }

IMAGE_NAME=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/${SERVER_IMAGE_BASE_NAME}
printf "Build container image - ${IMAGE_NAME}:${GIT_REVISION}\n"
pushd ${BDIR}/app

docker-slim build --dockerfile Dockerfile --include-path-file=../includefile --tag-fat $IMAGE_NAME .
popd

printf "BUILD IMAGE [DONE]\n"
popd
