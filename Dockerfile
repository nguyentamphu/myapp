FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /root/myapp
WORKDIR /root/myapp
COPY Gemfile /root/myapp/Gemfile
RUN bundle install --path /var/myapp/bundle --jobs 4
COPY . /root/myapp
