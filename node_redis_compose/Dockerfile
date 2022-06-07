FROM node:8.11

WORKDIR /opt/my/service

COPY service /opt/my/service

RUN yarn install

EXPOSE 1300

ENTRYPOINT ["node", "/opt/my/service/server.js"]
