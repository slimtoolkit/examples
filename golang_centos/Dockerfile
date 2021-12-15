FROM centos:7

RUN yum -y update && yum clean all

RUN mkdir -p /go && chmod -R 777 /go && \
	yum -y install epel-release --enablerepo=extras && \
    yum -y install git golang --nogpgcheck && yum clean all

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

WORKDIR /app
ADD . /app
RUN go build -o app

ENTRYPOINT ["/app/app"]




