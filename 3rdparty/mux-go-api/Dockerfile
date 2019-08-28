FROM ubuntu:18.04

RUN apt-get update -y \
  && apt-get install -y git gcc make golang-1.10

ENV GOROOT /usr/lib/go-1.10
ENV PATH $GOROOT/bin:$PATH
ENV GOPATH /root/go
ENV APIPATH /root/go/src/api

WORKDIR $APIPATH
COPY . .

RUN \ 
  go get -d -v \
  && go install -v \
  && go build

EXPOSE 3000
CMD ["./api"]
