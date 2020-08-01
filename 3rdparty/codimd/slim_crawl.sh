#!/usr/bin/env bash

docker-slim build --continue-after=enter --http-probe-crawl --http-probe-cmd /new --http-probe-cmd /features --http-probe-cmd POST:/login --http-probe-cmd POST:/register --network deployments_default --env CMD_ALLOW_ANONYMOUS=true --env CMD_ALLOW_ANONYMOUS_EDITS=true --env CMD_USECDN=false --env CMD_DB_URL=postgres://codimd:change_password@database/codimd --include-path=/home/hackmd/app/public --include-path /home/hackmd/app/lib/migrations dslimexamples/codimd
