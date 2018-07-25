FROM ruby:2.4-alpine

COPY assets/* /opt/resource/
RUN chmod +x /opt/resource/*

WORKDIR /opt/resource
RUN bundle install
