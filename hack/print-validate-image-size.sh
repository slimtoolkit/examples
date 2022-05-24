#!/usr/bin/env bash

set -euo pipefail

ACTUAL_BYTES=$(docker image inspect --format "{{.Size}}" ${EXPECTED_IMAGE_NAME})
ACTUAL_MBYTES=$((${ACTUAL_BYTES} / 1048576))

echo "Found Image Size: ${ACTUAL_MBYTES}Mi"

if [ "${EXPECTED_IMAGE_SIZE}" = "" ]; then
    echo "WARNING! The expected image size is unknown! Consider setting EXPECTED_IMAGE_SIZE_(SLIM|FAT)_${ARCH} variables!"
    exit 0
fi

EXPECTED_BYTES=$(docker run --platform=linux/amd64 --rm cmd.cat/numfmt numfmt --from auto ${EXPECTED_IMAGE_SIZE} 2>/dev/null)
EXPECTED_MBYTES=$((${EXPECTED_BYTES} / 1048576))

echo "Expected Size:    ${EXPECTED_MBYTES}Mi"

if [ ${EXPECTED_MBYTES} = ${ACTUAL_MBYTES} ] ; then
    echo "OK"
    exit 0
else
    echo "FAIL!"
    exit 1
fi
