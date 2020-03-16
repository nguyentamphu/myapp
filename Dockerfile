FROM ruby:2.6.5
MAINTAINER phunt <phunt@runsystem.net>

# Install nesscessary packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev \
    nodejs vim curl wget

# Install yarn
RUN DEBIAN_FRONTEND='noninteractive' \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN DEBIAN_FRONTEND='noninteractive' \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND='noninteractive' \
    apt update && apt install -y yarn

# Rails app
RUN mkdir /root/myapp
WORKDIR /root/myapp
COPY Gemfile /root/myapp/Gemfile
RUN bundle install --path /opt/myapp/bundle --jobs 4
COPY . /root/myapp
