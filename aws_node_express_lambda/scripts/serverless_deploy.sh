#!/usr/bin/env bash

set -euo pipefail

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
CDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd ${BDIR}
source _app.env

printf "SLS DEPLOY [START]\n"

printf "BDIR: ${BDIR}\n"
printf "CDIR: ${CDIR}\n"
printf "AWS_ACCOUNT: ${AWS_ACCOUNT}\n"
printf "AWS_REGION: ${AWS_REGION}\n"
printf "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}\n"

[[ -z "${AWS_ACCESS_KEY_ID:-}" ]] && { echo "AWS_ACCESS_KEY_ID is not set"; exit 1; }
[[ -z "${AWS_SECRET_ACCESS_KEY:-}" ]] && { echo "AWS_SECRET_ACCESS_KEY is not set"; exit 1; }

printf "Deploying...\n"
serverless deploy
printf "SLS DEPLOY [DONE]\n"
popd
