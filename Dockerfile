FROM phusion/passenger-ruby23

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim tzdata

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Expose Nginx HTTP service
EXPOSE 80

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx site and config
ADD nginx.conf /etc/nginx/sites-enabled/webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# Install bundle of gems
WORKDIR /home/app/myapp
ADD Gemfile /home/app/myapp
#ADD Gemfile.lock /myapp/
RUN bundle install

# Add the Rails app
ADD . /home/app/myapp
RUN chown -R app:app /home/app/myapp

# Clean up APT and bundler when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
