here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm -p 80:80 nginx.slim
