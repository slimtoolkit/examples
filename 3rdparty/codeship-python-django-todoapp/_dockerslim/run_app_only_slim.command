#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="django_todo_app" -p 8000:8000 -e "DATABASE_URL=postgres://todoapp@postgres/todos" --network codeship-python-django-todoapp_default codeship-python-django-todoapp_web.slim




