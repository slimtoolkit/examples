FROM ruby:2.6-alpine3.11

RUN apk update && apk add build-base ruby-dev tzdata && \
		mkdir -p /opt/my/service

WORKDIR /opt/my/service
COPY service /opt/my/service

RUN bundle install

EXPOSE 1300
ENTRYPOINT ["bundle","exec", "puma","--bind=tcp://0.0.0.0:1300","--environment=development"]
