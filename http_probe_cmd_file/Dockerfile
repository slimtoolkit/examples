FROM node:18

LABEL version=0.1 maintainer="docker-slim examples"

#testing sudo sticky bit
RUN apt-get update && apt-get -y install sudo

RUN mkdir -p /opt/my/service
COPY service /opt/my/service
WORKDIR /opt/my/service

#extra instructions for testing duplicate detection logic
RUN cp server.js server_copy.js
RUN cp server_copy.js srv_another.js

#extra instruction for testing
RUN echo more >> dummyfile

RUN npm install

#extra instruction for testing
RUN rm dummyfile
#RUN chmod +t dummyfile
RUN chmod +t /usr/bin/sudo

EXPOSE 1300
ENTRYPOINT ["node", "/opt/my/service/server.js"]
