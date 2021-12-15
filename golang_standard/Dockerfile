FROM golang:1.15
WORKDIR /app
ADD . /app
RUN go build -o app

ENTRYPOINT ["/app/app"]
