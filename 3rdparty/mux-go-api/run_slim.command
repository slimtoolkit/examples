here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm -p 3000:3000 mux-go-api-ubuntu.slim
