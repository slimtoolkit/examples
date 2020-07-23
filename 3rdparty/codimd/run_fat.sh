#!/usr/bin/env bash

docker run -it --rm -p 3000:3000 --network deployments_default -e CMD_ALLOW_ANONYMOUS=true -e CMD_ALLOW_ANONYMOUS_EDITS=true -e CMD_USECDN=false -e CMD_DB_URL=postgres://codimd:change_password@database/codimd dslimexamples/codimd