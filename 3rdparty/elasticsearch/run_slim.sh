#!/usr/bin/env bash

docker run -it --rm -p 9200:9200 -e "node.name=slim" -e "cluster.initial_master_nodes=slim" docker.elastic.co/elasticsearch/elasticsearch-full.slim
