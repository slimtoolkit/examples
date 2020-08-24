#!/usr/bin/env bash

docker run -it --rm --security-opt seccomp=dslimexamples-carbon.now.sh-seccomp.json -p 3000:3000 dslimexamples/carbon.now.sh.slim