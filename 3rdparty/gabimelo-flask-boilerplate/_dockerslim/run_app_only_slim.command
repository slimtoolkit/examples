#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="flask_nginx_app" -p 5000:80 --network gabimelo-flask-boilerplate_default gabimelo-flask-boilerplate_app.slim



