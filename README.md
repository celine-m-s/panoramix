# Project

A dashboard to gather all the services you like. All in one place.

# Run with Docker
Install Docker and run the following commands:
- `docker-compose build`
- `docker-compose up`

# Postgresql and database

You need to create the postgresql role and the databases and then migrate.

    psql -f postgresql.txt && RAILS_ENV=test rake db:migrate && rake db:migrate

# Visit online
Project is online!
- staging: [https://infinite-woodland-84972.herokuapp.com/](https://infinite-woodland-84972.herokuapp.com/)
- production: [https://panoramix-production.herokuapp.com/](https://panoramix-production.herokuapp.com/)

# Ember

The frontend repository is at `app/assets/javascript/frontend`. Ember builds automatically when a Rails server is launched.

We use Uikit as a Bootstrap template. [More information to be found here](https://getuikit.com/docs/cover). 
Useful links:
- https://emberigniter.com/how-to-equals-conditional-comparison-handlebars/
- https://github.com/jmurphyau/ember-truth-helpers
