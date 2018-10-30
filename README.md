# README

## Requirements:

1) docker 18+
2) docker-compose 1.22+

## Gettting started

To build image:
`docker-compose build`

To finish project setup:
`docker-compose run --rm web bash -c "bundle install && rails db:create db:migrate db:seed spree_samlpe:load"`

To start project:
`docker-compose up`

To run tests
`docker-compose run --rm web bin/rspec`
