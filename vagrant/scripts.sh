#!/usr/bin/env bash

RUBY_MAJOR=$1
RUBY_VERSION=$2
RAILS_VER=$3
echo -e "### RUBY_MAJOR = $RUBY_MAJOR \nRUBY_VERSION = $RUBY_VERSION\nRAILS_VER = $RAILS_VER\n"

# Install nesscessary packages
echo -e "#################################### apt-get update -y -qq\n"
apt-get update -y -qq

echo -e "#################################### apt install -y curl\n"
apt install -y curl

DEBIAN_FRONTEND='noninteractive' curl -sL https://deb.nodesource.com/setup_12.x | -E bash -
DEBIAN_FRONTEND='noninteractive' curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
DEBIAN_FRONTEND='noninteractive' echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

echo -e "#################################### apt-get update -y -qq\n"
apt-get update -y -qq

echo -e "#################################### apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
\n"
apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install Ruby
echo -e "#################################### cd ~\n"
cd

echo -e "#################################### Install Ruby version $RUBY_VERSION\n"
wget http://ftp.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz
tar -xzvf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION/
./configure
make
sudo make install
ruby -v

echo -e "#################################### gem install bundler\n"
gem install bundler

echo -e "#################################### Install Rails version $RAILS_VER\n"
gem install rails -v $RAILS_VER

echo -e "#################################### apt-get -y install build-essential libmysqlclient-dev\n"
apt-get -y install build-essential libmysqlclient-dev

echo -e "#################################### Scripts executed successfully!\n"
