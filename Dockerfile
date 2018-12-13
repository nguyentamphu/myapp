# ARG ruby version from docker-compose
ARG tag

FROM ruby:$tag
MAINTAINER phunt<phunt@runsystem.net>
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim less

RUN mkdir /root/graphql
WORKDIR /root/graphql

ADD . /root/graphql
RUN bundle install
