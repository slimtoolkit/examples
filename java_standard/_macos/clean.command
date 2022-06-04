#!/usr/bin/env bash

cd $(dirname "$0")/..

cmd="$(basename "$0")"
make "${cmd%%.*}"
