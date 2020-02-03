#!/usr/bin/env bash

docker-slim build --http-probe=false --show-clogs=true --cmd="remote add demo https://demo.morpheusdata.com -N" morpheusdata/morpheus-cli
