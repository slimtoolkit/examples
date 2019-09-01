here="$(dirname "$BASH_SOURCE")"
cd $here

docker run -it --rm --security-opt seccomp=nginx-seccomp.json -p 80:80 nginx.slim
