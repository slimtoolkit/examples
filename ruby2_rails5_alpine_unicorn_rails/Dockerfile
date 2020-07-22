FROM ruby:2.6-alpine3.11

RUN apk update && apk add build-base ruby-dev tzdata && \
		mkdir -p /opt/my/service

WORKDIR /opt/my/service
COPY service /opt/my/service

RUN bundle install --jobs 20

EXPOSE 1300
CMD ["unicorn_rails","-p","1300","-c","config/unicorn.rb"]
