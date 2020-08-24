#!/usr/bin/env bash

docker-slim build --copy-meta-artifacts . --tag nginx_alpine.slim nginx:alpine