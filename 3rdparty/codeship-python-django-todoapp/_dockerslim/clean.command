#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here/..

docker rmi codeship-python-django-todoapp_web.slim
docker rmi codeship-python-django-todoapp_web


