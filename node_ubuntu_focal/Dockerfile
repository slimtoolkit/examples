FROM ubuntu:20.04

RUN apt-get update && \
		DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
		apt-get install -y nodejs npm && \
		mkdir -p /opt/my/service

COPY service /opt/my/service

WORKDIR /opt/my/service

RUN npm install

EXPOSE 1300
ENTRYPOINT ["node","/opt/my/service/server.js"]


