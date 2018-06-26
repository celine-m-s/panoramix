# https://docs.docker.com/engine/reference/builder/#format
# for later: maybe use Alpine
# but commands are not the same so caution!

FROM ruby:2.4.1

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  libxml2-dev \
  libxslt1-dev \
  libqtwebkit4 \
  libqt4-dev \
  xvfb \
  python-dev

ENV APP_HOME /usr/src/panoramix/
RUN mkdir $APP_HOME

# This defines the base directory from which all our commands are executed.
WORKDIR $APP_HOME

# This copies files from the host machine (in our case, relative to Dockerfile on OS X) to the container.
COPY Gemfile Gemfile.lock $APP_HOME/ 
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY entrypoint.sh /entrypoint.sh
RUN ln -s /usr/bin/nodejs /usr/bin/node

ADD . $APP_HOME

######### NODE ###########
# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 9.8.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH


######## EMBER ############

# install bower
RUN \
  npm install -g ember-cli@2.12 \
  ember install ember-cli-rails-addon \
  npm install -g bower@1.8.2


WORKDIR $APP_HOME/app/assets/javascripts/frontend/


# ==================================================
LABEL \
    image_name="panoramix" \
    libelle="Celine MS - Panoramix project" \
    version="0.1.0"
