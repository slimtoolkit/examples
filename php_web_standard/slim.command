#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here
docker-slim build my/php-web-app
