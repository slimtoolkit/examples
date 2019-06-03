#!/usr/bin/env bash

here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --name="java_dropwizard_corretto_slim" -p 8080:8080 my/java-dropwizard-corretto.slim



