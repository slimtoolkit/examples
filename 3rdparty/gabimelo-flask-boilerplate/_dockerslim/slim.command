#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --http-probe --expose 80 --network gabimeloflaskboilerplate_default gabimeloflaskboilerplate_app
