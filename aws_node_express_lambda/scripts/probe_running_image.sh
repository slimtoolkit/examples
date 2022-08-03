#!/usr/bin/env bash

set -euo pipefail

printf "\nGET /hello\n"
curl -X POST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"httpMethod":"GET", "path":"/hello", "headers": {"User-Agent": "custom UA"}}'

printf "\n\nPOST /stuff\n"
curl -X POST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"httpMethod":"POST", "path":"/stuff", "body":"{\"key\":\"val data\"}", "headers": {"Content-Type": "application/json"}}'

printf "\n\n"
