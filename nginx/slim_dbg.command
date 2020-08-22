here="$(dirname "$BASH_SOURCE")"
cd $here

docker-slim --debug build --show-clogs nginx
