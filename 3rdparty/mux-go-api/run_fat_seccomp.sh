#!/usr/bin/env bash

docker run -it --rm --security-opt seccomp=mux-go-api-ubuntu-seccomp.json -p 3000:3000 mux-go-api-ubuntu
