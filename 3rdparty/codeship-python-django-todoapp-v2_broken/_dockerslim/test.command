#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

curl http://localhost:8000/todos/ -v
