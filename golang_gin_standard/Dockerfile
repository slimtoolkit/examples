FROM golang:1.17
WORKDIR /app
ADD service/ /app
RUN cd /app && go get . && go build -o app
EXPOSE 1300

ENTRYPOINT ["/app/app"]
