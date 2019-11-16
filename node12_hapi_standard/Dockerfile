FROM node:12

RUN mkdir -p /opt/my/service
COPY service /opt/my/service
WORKDIR /opt/my/service

RUN npm install

EXPOSE 1300
ENTRYPOINT ["node","/opt/my/service/server.js"]


