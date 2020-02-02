#!/usr/bin/env bash

docker-slim build --expose 80 --http-probe-cmd /blog --http-probe-cmd /about --include-path /srv/templates --include-path /srv/static ubuntu-com
