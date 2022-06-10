![DSLIM1](assets/images/dslim/DockerSlimLogo1Big.png)

[![Follow](https://img.shields.io/twitter/url/http/shields.io.svg?style=social&label=Follow)](https://twitter.com/DockerSlim)
[![Gitter chat](https://badges.gitter.im/docker-slim/docker-slim.svg)](https://gitter.im/docker-slim/community)
[![Discord chat](https://img.shields.io/static/v1.svg?label=chat&message=on%20discord&color=7389D8)](https://discord.gg/9tDyxYS)

# Overview

`docker-slim` has been used with Node.js, Python, Ruby, Java, Go, Rust, Elixir and PHP (some app types) running on Ubuntu, Debian, CentOS and Alpine Linux.

Active areas of interest:
* Complex Python, Ruby and PHP examples with the popular application servers and Nginx or Apache.
* Python, Node.js, Ruby and PHP applications packaged in CentOS-based images.
* Examples with fat container images with multiple components/applications/services.
* Examples with the most popular process supervisors / init tools.


# Current Minification Examples

Node.js application images:

* from ubuntu:14.04    - 432MB  => 14MB   (minified by **30.85X**)
* from debian:jessie   - 406MB  => 25.1MB (minified by **16.21X**)
* from node:alpine     - 66.7MB => 34.7MB (minified by **1.92X**)
* from node:distroless - 72.7MB => 39.7MB (minified by **1.83X**)

Python application images:

* from ubuntu:14.04             - 438MB  => 16.8MB (minified by **25.99X**)
* from python:2.7-alpine        - 84.3MB => 23.1MB (minified by **3.65X**)
* from python:2.7.15            - 916MB  => 27.5MB (minified by **33.29X**)
* from centos:7                 - 647MB  => 23MB   (minified by **28.57X**)
* from centos/python-27-centos7 - 700MB  => 24MB   (minified by **29.01X**)
* from python2.7:distroless     - 60.7MB => 18.3MB (minified by **3.32X**)

Ruby application images:

* from ubuntu:14.04    - 433MB => 13.8MB (minified by **31.31X**)
* from ruby:2.2-alpine - 319MB => 27MB   (minified by **11.88X**)
* from ruby:2.5.3      - 978MB => 30MB   (minified by **32.74X**)

Go application images:

* from golang:latest - 700MB => 1.56MB (minified by **448.76X**)
* from ubuntu:14.04  - 531MB => 1.87MB (minified by **284.10X**)
* from golang:alpine - 258MB => 1.56MB (minified by **165.61X**)
* from centos:7      - 615MB => 1.87MB (minified by **329.14X**)

Rust application images:

* from rust:1.31 - 2GB => 14MB (minified by **147.16X**) 

Java application images:

* from ubuntu:14.04 - 743.6 MB => 100.3 MB

PHP application images:

* from php:7.0-cli - 368MB => 26.6MB (minified by **13.85X**)

Haskell application images:

* (Scotty service) from haskell:8 - 2.09GB => 16.6MB (minified by **125.32X**)
* (Scotty service) from haskell:7 - 1.5GB => 21MB (minified by **71X**)

Elixir application images:

* (Phoenix service) from elixir:1.6 - 1.1GB => 37MB (minified by **29.25X**)

.NET application images:

* from mcr.microsoft.com/dotnet/runtime-deps:5.0-alpine-amd64       - 31MB  => 28MB (minified by **1.11X**)
* from mcr.microsoft.com/dotnet/runtime-deps:5.0-buster-slim-amd64  - 132MB => 32MB (minified by **4.11X**)
* from mcr.microsoft.com/dotnet/runtime-deps:5.0-focal-amd64        - 140MB => 32MB (minified by **4.31X**)


# How to use examples

While DockerSlim is capable of more, at the moment, the majority of the examples illustrate
the image minification procedure using `docker-slim build` command in its various modes. 

A typical example has a _README_ file describing its purpose and basic usage.
Normally, there is also a _Makefile_ with the `default` target. So, running
`make` or `make default` from inside of the example folder would execute the example
for you _end-to-end_ outputting all the used commands on the way.

Most frequently used `make` targets:

```sh
# All example types
make                             # run example (semi-automatic)
make test-e2e                    # run the acceptance test suite
make clean                       # remove all artifacts created by this example


# 'CLI application' example type
make fat-build                   # build the "fat" version of the image
make fat-run-interactive         # run the CLI app using the "fat" image

make slim-build                  # turn the "fat" image into a "slim" one
make slim-run-interactive        # run the CLI app using the "slim" image

make slim-build-from-dockerfile  # build the "slim" version of the image using the "fat" Dockerfile


# 'Web Service' example type
make fat-build                   # build the "fat" version of the image
make fat-run                     # run the web service using the "fat" image
make fat-run-seccomp             # run the "fat" image using generated seccomp profile
make fat-validate                # send a request to the running web service
make fat-stop                    # stop the running web service

make slim-build                  # turn the "fat" image into a "slim" one
make slim-run                    # run the web service using the "slim" image
make slim-run-seccomp            # run the "slim" image using generated seccomp profile
make slim-validate               # send a request to the running web service
make slim-stop                   # stop the running web service

make slim-build-from-dockerfile  # build the "slim" version of the image using the "fat" Dockerfile

make debug-sidecar               # run a debug sidecar container with an interactive shell


'Docker Compose' example type
make fat-build                   # build the "fat" version of the image
make fat-run                     # run the compose file using the "fat" image
make fat-validate                # send a request to the running web service
make fat-stop                    # stop the running web service

make slim-build-compose          # turn the "fat" image into a "slim" one using docker-compose file
make slim-run                    # run the compose file using the "slim" image
make slim-validate               # send a request to the running web service
make slim-stop                   # stop the running web service
```
