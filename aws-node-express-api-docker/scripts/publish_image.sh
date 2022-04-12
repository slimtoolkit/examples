#!/usr/bin/env bash

set -euo pipefail

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
CDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

source _app.env

printf "PUBLISH IMAGE [START]\n"

printf "BDIR: ${BDIR}\n"
printf "CDIR: ${CDIR}\n"
printf "GIT_REVISION: ${GIT_REVISION}\n"
printf "AWS_ACCOUNT: ${AWS_ACCOUNT}\n"
printf "AWS_REGION: ${AWS_REGION}\n"
printf "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}\n"

[[ -z "${GIT_REVISION:-}" ]] && { echo "GIT_REVISION is not set"; exit 1; }
[[ -z "${AWS_ACCOUNT:-}" ]] && { echo "AWS_ACCOUNT is not set"; exit 1; }
[[ -z "${AWS_REGION:-}" ]] && { echo "AWS_REGION is not set"; exit 1; }
[[ -z "${AWS_ACCESS_KEY_ID:-}" ]] && { echo "AWS_ACCESS_KEY_ID is not set"; exit 1; }
[[ -z "${AWS_SECRET_ACCESS_KEY:-}" ]] && { echo "AWS_SECRET_ACCESS_KEY is not set"; exit 1; }

ECR_ENDPOINT=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com
printf "ECR_ENDPOINT: ${ECR_ENDPOINT}\n"

ECR_PSWD=$(docker run --rm -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} amazon/aws-cli --region ${AWS_REGION} ecr get-login-password)
echo $ECR_PSWD | docker login --username AWS --password-stdin ${ECR_ENDPOINT}

ECR_IMAGE_NAME_SHORT=${SERVER_IMAGE_BASE_NAME}
ECR_IMAGE_NAME=${ECR_ENDPOINT}/${ECR_IMAGE_NAME_SHORT}

ECR_EXISTING_IMAGE=$(docker run --rm -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} amazon/aws-cli --region ${AWS_REGION} ecr describe-repositories | jq ".repositories | map(select(.repositoryName | contains (\"${ECR_IMAGE_NAME_SHORT}\"))) | .[] .repositoryUri" | tr -d '"')
printf "ECR_EXISTING_IMAGE: ${ECR_EXISTING_IMAGE}\n"

if [ -z "${ECR_EXISTING_IMAGE:-}" ]; then
  printf "Creating ECR repository for image ${ECR_IMAGE_NAME}\n"
  docker run --rm -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} amazon/aws-cli --region ${AWS_REGION} ecr create-repository --repository-name ${ECR_IMAGE_NAME_SHORT}
fi

docker push ${ECR_IMAGE_NAME}:${GIT_REVISION}

printf "PUBLISH IMAGE [DONE]\n"
