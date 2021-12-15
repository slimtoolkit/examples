FROM golang:1.15-alpine
WORKDIR /app
ADD . /app
RUN go build -o app

ENTRYPOINT ["/app/app"]
