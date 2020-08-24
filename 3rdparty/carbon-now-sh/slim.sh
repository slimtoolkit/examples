#!/usr/bin/env bash

docker-slim build --copy-meta-artifacts . --include-path=/app/.next --include-path=/app/public dslimexamples/carbon.now.sh
