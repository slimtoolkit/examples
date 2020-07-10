FROM ruby:2.5.3

WORKDIR /opt/my/service
COPY service /opt/my/service

RUN bundle install

EXPOSE 1300
ENTRYPOINT ["bundle","exec", "puma","--bind=tcp://0.0.0.0:1300","--environment=development"]


