#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --http-probe-cmd /todos/ --expose 8000 --network codeshippythondjangotodoapp_default --env 'DATABASE_URL=postgres://todoapp@postgres/todos' codeshippythondjangotodoapp_web
