#!/usr/bin/env bash

set -euo pipefail

Mi=1048576

ACTUAL_BYTES=$(docker image inspect --format "{{.Size}}" ${EXPECTED_IMAGE_NAME})
ACTUAL_MBYTES=$((${ACTUAL_BYTES} / ${Mi}))

echo "Found Image Size: ${ACTUAL_MBYTES}Mi"

if [ "${EXPECTED_IMAGE_SIZE}" = "" ]; then
    echo "WARNING! The expected image size is unknown! Consider setting EXPECTED_IMAGE_SIZE_(SLIM|FAT)_${ARCH} variables!"
    exit 0
fi

EXPECTED_BYTES=$(docker run --platform=linux/amd64 --rm cmd.cat/numfmt numfmt --from auto ${EXPECTED_IMAGE_SIZE} 2>/dev/null)
EXPECTED_DEVIATION=$((5 * ${EXPECTED_BYTES} / 100))  # 5% from the total size

MAX_DEVIATION=$((20 * ${Mi}))  # +/-20MiB
if [ "${EXPECTED_DEVIATION}" -gt "${MAX_DEVIATION}" ]; then
    EXPECTED_DEVIATION=${MAX_DEVIATION}
fi

EXPECTED_BYTES_MIN=$((${EXPECTED_BYTES} - ${EXPECTED_DEVIATION}))
EXPECTED_BYTES_MAX=$((${EXPECTED_BYTES} + ${EXPECTED_DEVIATION}))

EXPECTED_MBYTES_MIN=$((${EXPECTED_BYTES_MIN} / ${Mi}))
EXPECTED_MBYTES_MAX=$((${EXPECTED_BYTES_MAX} / ${Mi}))

echo "Expected Size:    ${EXPECTED_MBYTES_MIN}Mi-${EXPECTED_MBYTES_MAX}Mi"

if [ "${EXPECTED_MBYTES_MIN}" -gt "${ACTUAL_MBYTES}" ] ; then
    echo "MIN=${EXPECTED_MBYTES_MIN} ACT=${ACTUAL_MBYTES}"
    echo "Image Check Failed - Image Size Is Too Small!"
    exit 1
fi
if [ "${EXPECTED_MBYTES_MAX}" -lt "${ACTUAL_MBYTES}" ] ; then
    echo "Image Check Failed - Image Size Is Too Big!"
    exit 1
fi

echo "OK"
exit 0
