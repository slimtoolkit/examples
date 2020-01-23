FROM node:6.11.0-alpine

RUN mkdir -p /opt/my/service

COPY service /opt/my/service

WORKDIR /opt/my/service

RUN npm install

EXPOSE 1300
ENTRYPOINT ["node","/opt/my/service/server.js"]


