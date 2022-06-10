FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get install golang -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV GOPATH /go
ENV GOROOT /usr/lib/go
ENV PATH /usr/lib/go/bin:/go/bin:/usr/local/bin:$PATH

WORKDIR /app
ADD . /app
RUN GO111MODULE=off go build -o app

ENTRYPOINT ["/app/app"]
