here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim build --tag nginx_alpine.slim nginx:alpine
