#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="java_xdropwizard_slim" -p 9090:9090 my/java-xdropwizard.slim



