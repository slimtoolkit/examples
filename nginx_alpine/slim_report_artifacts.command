here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim --report nginx.slim.report.json build --copy-meta-artifacts . --tag nginx_alpine.slim nginx:alpine
