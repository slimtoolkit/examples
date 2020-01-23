FROM golang:1.13
WORKDIR /app
ADD . /app
RUN cd /app && go build -o app

ENTRYPOINT ["/app/app"]
