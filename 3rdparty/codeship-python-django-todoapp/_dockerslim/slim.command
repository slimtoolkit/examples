#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --http-probe-cmd /todos/ --expose 8000 --network codeship-python-django-todoapp_default --env 'DATABASE_URL=postgres://todoapp@postgres/todos' codeship-python-django-todoapp_web
