# postgres-dbs-docker
This repository contains a docker compose file to use with certain projects of mine. It just sets up a postgres server and inits some databases, schemas and maybe test data.

## Run
Make sure you have docker installed, then just enter
```bash
$ docker compose up
```
There is an `.env` file if you need to configure some parameters differently like ports for example.

## Currently used in
* [auth-service-nestjs](https://github.com/pixelprodukt/auth-service-nestjs) 
* [budgetmanager-service](https://github.com/pixelprodukt/budgetmanager-service)

Those repositories need at least a database with the schema as created in the scripts in the ./db folder. This whole repo is just for local usage.