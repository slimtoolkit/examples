here="$(dirname "$BASH_SOURCE")"
cd $here

docker build -f Dockerfile -t mux-go-api-ubuntu .
