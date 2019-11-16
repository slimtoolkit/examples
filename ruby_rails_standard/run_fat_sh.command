#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --security-opt seccomp=unconfined -p 3333:3333 --entrypoint bash my/ruby-rails-app



