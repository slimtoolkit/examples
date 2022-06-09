#!/usr/bin/env bash

set -euo pipefail

ACTUAL=$(docker image inspect ${IMAGE} --format "{{ index .Config.Labels \"${LABEL}\" }}")

if [ "${VALUE}" = "${ACTUAL}" ]; then
    exit 0
else
    echo "Image ${IMAGE} has unexpected label ${LABEL}. Expected [${VALUE}], but got [${ACTUAL}]"
    exit 1
fi
