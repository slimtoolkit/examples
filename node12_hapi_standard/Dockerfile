FROM node:12
LABEL version=0.1 \
	  maintainer="docker-slim examples"
LABEL test.label=xyz

ENV TEST_ENV_ONE=1
ENV TEST_ENV_TWO="env two"

VOLUME /opt/test.volume/one
VOLUME /opt/test.volume/two

RUN mkdir -p /opt/my/service
COPY service /opt/my/service
WORKDIR /opt/my/service

RUN npm install

EXPOSE 1300
ENTRYPOINT ["node","/opt/my/service/server.js"]


