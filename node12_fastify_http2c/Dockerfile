FROM node:12

LABEL version=0.1 \
	  maintainer="docker-slim examples"
LABEL app.stack=node
LABEL app.framework=fastify
LABEL app.feature=api
LABEL app.feature=swagger.spec
LABEL app.feature=swagger.ui

WORKDIR /opt/my/service

COPY service/package*.json ./
RUN npm install

COPY service .

EXPOSE 1300
ENTRYPOINT ["node","/opt/my/service/server.js"]
#ENTRYPOINT ["npm","start"]
