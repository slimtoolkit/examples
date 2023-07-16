#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="db_create" -e DATABASE_PASS=password -e DATABASE_URL='postgres://todoapp@postgres/todos' --network codeship-python-django-todoapp-v2_default codeship-python-django-todoapp-v2-web python manage.py migrate

