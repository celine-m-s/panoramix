# https://docs.docker.com/engine/reference/builder/#format

FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /usr/src/panoramix/
RUN mkdir $APP_HOME

# This defines the base directory from which all our commands are executed.
WORKDIR $APP_HOME

# This copies files from the host machine (in our case, relative to Dockerfile on OS X) to the container.
COPY Gemfile Gemfile.lock $APP_HOME/ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

#ADD Gemfile $APP_HOME/Gemfile
#ADD Gemfile.lock $APP_HOME/Gemfile.lock
#RUN bundle install

ADD . $APP_HOME

# ==================================================
LABEL \
    image_name="panoramix" \
    libelle="Celine MS - Panoramix project" \
    version="0.1.0"
