![DSLIM1](assets/images/dslim/DockerSlimLogo1Big.png)

[![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?url=&text=Don't%20change%20anything%20in%20your%20Docker%20container%20image%20and%20minify%20it%20by%20up%20to%2030x%20making%20it%20secure%20too!&url=http%3A%2F%2Fdockersl.im&hashtags=docker,small,secure)

# Overview

`docker-slim` has been used with Node.js, Python, Ruby, Java, Golang, Rust, Elixir and PHP (some app types) running on Ubuntu, Debian, CentOS and Alpine Linux.

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

Golang application images:

* from golang:latest - 700MB => 1.56MB (minified by **448.76X**)
* from ubuntu:14.04  - 531MB => 1.87MB (minified by **284.10X**)
* from golang:alpine - 258MB => 1.56MB (minified by **165.61X**)
* from centos:7      - 615MB => 1.87MB (minified by **329.14X**)

Rust application images:

* from rust:1.31 - 2GB => 14MB (minified by **147.16X**) 

JAVA application images:

* from ubuntu:14.04 - 743.6 MB => 100.3 MB

PHP application images:

* from php:7.0-cli - 368MB => 26.6MB (minified by **13.85X**)

Haskell application images:

* (Scotty service) from haskell:8 - 2.09GB => 16.6MB (minified by **125.32X**)

Elixir application images:

* (Phoenix service) from elixir:1.6 - 1.1GB => 37MB (minified by **29.25X**)

