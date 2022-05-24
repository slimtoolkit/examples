FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:gophers/archive -y && \
    apt-get update && \
    apt-get install golang-1.10-go -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV GOPATH /go
ENV GOROOT /usr/lib/go-1.10
ENV PATH /usr/lib/go-1.10/bin:/go/bin:/usr/local/bin:$PATH

WORKDIR /app
ADD . /app
RUN go build -o app

ENTRYPOINT ["/app/app"]




