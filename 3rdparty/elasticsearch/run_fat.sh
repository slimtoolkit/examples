#!/usr/bin/env bash

docker run -it --rm -p 9200:9200 -e "node.name=fat" -e "cluster.initial_master_nodes=fat" elasticsearch:test

