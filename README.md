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
