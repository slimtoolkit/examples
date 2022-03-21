#!/usr/bin/env bash

docker-slim build --copy-meta-artifacts . --include-app-next-build-dir --include-app-next-static-dir dslimexamples/carbon.now.sh
