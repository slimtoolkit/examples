FROM ruby:2.5.3

WORKDIR /opt/my/service
COPY service /opt/my/service

RUN bundle install

EXPOSE 1300
ENTRYPOINT ["rails","server","--binding=0.0.0.0","--port=1300","--environment=development"]


