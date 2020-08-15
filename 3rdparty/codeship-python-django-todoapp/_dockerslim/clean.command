#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here/..

docker rmi codeshippythondjangotodoapp_web.slim
docker rmi codeshippythondjangotodoapp_web


