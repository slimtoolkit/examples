FROM node:12

WORKDIR /usr/src/app
COPY service/package*.json ./
RUN npm install
COPY service/ .

EXPOSE 1300
CMD [ "npm", "start" ]
