FROM node:17
ADD service /service
WORKDIR /service
RUN yarn install
EXPOSE 1300
ENTRYPOINT [ "node", "server.js" ]

