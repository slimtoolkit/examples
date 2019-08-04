#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim --report ruby-rails-app.slim.report.json  build --http-probe my/ruby-rails-app


