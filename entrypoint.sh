#!/bin/bash
# entrypoint of container for Docker
# google bash tips

set -eux -o pipefail

db_semaphore="/db_created" 

# if I 'don't find the file, create a db
# crochets = teste si
# Dans la versions allégée de Linux, on n'a pas /etc/var mais on a /var.
if [ ! -f "${db_semaphore}" ]
then
  # wait for 5 seconds, enough time to run postgresql service.
  # NOT the best way to do it!
  sleep 5
  # Check if postgres service is available
  # automate à etat fini (théorie mathématique)
  # while service not available, try to connect.
  # Wait 2s. Circuit breaker.
  # TODO
  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:seed
  bundle exec rake movies:latests
  #bundle exec rake ember:install
  # ember install ember-cli-rails-addon
  touch "${db_semaphore}"
fi

bundle exec rails s -p 3000 -b '0.0.0.0'

# http://unethicalblogger.com/about
# askidoctor
# https://github.com/cedric-legallo/clg-bzhcamp2018/blob/step2/src/components/Product.vue