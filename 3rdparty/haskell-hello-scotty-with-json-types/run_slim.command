#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm -p 3000:3000 my/haskell-scotty-hello-standard.slim



