#!/usr/bin/env bash

docker run -it --rm --security-opt seccomp=nginx-seccomp.json -p 80:80 nginx:alpine
