#!/usr/bin/env bash

docker-slim build --show-clogs --env "node.name=ds" --env "cluster.initial_master_nodes=ds" --include-path '/usr/share/elasticsearch/modules/ingest-geoip/GeoLite2-ASN.mmdb' --include-path '/usr/share/elasticsearch/modules/ingest-geoip/GeoLite2-City.mmdb' --include-path '/usr/share/elasticsearch/modules/ingest-geoip/GeoLite2-Country.mmdb' elasticsearch:test
