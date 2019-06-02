#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

printf '\n\nGET /admin/:\n\n'
curl http://localhost:9090/admin/

printf '\n\nGET /service/hello-world:\n\n'
curl http://localhost:9090/service/hello-world

printf '\n\nGET /admin/healthcheck:\n\n'
curl http://localhost:9090/admin/healthcheck

printf '\n\nDONE!\n\n'






