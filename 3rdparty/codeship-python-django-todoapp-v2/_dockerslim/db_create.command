#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="db_create" -e DATABASE_URL='postgres://todoapp@postgres/todos' --network codeshippythondjangotodoappv2_default codeshippythondjangotodoappv2_web python manage.py migrate

