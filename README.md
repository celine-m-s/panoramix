# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Docker

- Create a new Dockerfile with the following:
```
FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
```

- Create a new Gemfile (that will be overwritten in an instant):

```
source 'https://rubygems.org'
gem 'rails', '5.0.0.1'
```

- Create an empty Gemfile.lock

- Create docker-compose.yml:

```
version: '2'
services:
  db:
    image: postgres
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```

- run `docker-compose run web rails new . --force --database=postgresql --skip-bundle`

- run `docker-compose build`

`docker-compose run web bundle install`

- Change config/database.yml

```
development: &default
  adapter: postgresql
  encoding: unicode
  database: myapp_development
  pool: 5
  username: postgres
  password:
  host: db

test:
  <<: *default
  database: myapp_test
```

- boot the app: `docker-compose up`

- Create the database: open a new window and run `docker-compose run web rake db:create`

Run the console: `docker-compose run web rails console`

to stop it: `docker-compose stop web`

Useful commands:
- docker images

Docker ne fait qu'isoler des processus. 
container = coquille dans lequel le processus est isolé. Il a un filesystem propre. Ce dernier est en oignon 
Image docker = un package du file system (toutes les couches du filesystem + quelques commandes en plus). Un ensemble de layer. 

A partir d'une image on instancie des containers. 

docker run : 
- créer un container
- ajoute 1 layer au container en read-write par dessus
- et lance le process que je lui demande.

Utiliser des volumes pour lui donner des fichiers en entrée et les récupérer en sortie. 
On monte une zone de mon disque hôte dans le container directement. 

docker-compose : lancer plusieurs containers en même temps. 

etchost = là où je déclare des alias entre des adresses mails et des IP. 

Commencer par faire un docker build puis docker-compose

####

Après avoir ajouté le Dockerfile et le docker-compose.yml
1/ docker-compose up
To stop server: ctrl+c + docker-compose stop
If not working: delete tmp/pids/server.pid

