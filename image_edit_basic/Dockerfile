FROM node:18

LABEL version=0.1 maintainer="docker-slim examples"
LABEL app.stack=node

LABEL test_remove=remove
LABEL test_keep=keep

ENV TEST_REMOVE remove
ENV TEST_KEEP keep

WORKDIR /opt/my/service

COPY service/package*.json ./
RUN npm install

COPY service .

VOLUME /opt/test_volume/remove
VOLUME /opt/test_volume/keep

EXPOSE 1300

ENTRYPOINT ["node", "/opt/my/service/server.js"]
