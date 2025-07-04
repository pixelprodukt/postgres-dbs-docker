# postgres-dbs-docker
This repository contains a docker compose file to use with certain projects of mine. It just sets up a postgres server and inits some databases, schemas and maybe test data.

## Run
Make sure you have docker installed, then just enter
```bash
$ docker compose up
```
There is an `.env` file if you need to configure some parameters differently like ports for example.

Docker will also start an instance of [Adminer](https://www.adminer.org/de/) under http://localhost:8081 (8080 if you set to defaut). Select `PostgreSQL`, credentials are:
```
user: admin
password: admin
```

## Currently used in
* [auth-service-nestjs](https://github.com/pixelprodukt/auth-service-nestjs) 
* [budgetmanager-service](https://github.com/pixelprodukt/budgetmanager-service)
* okh-rdf-etl-service (wip)

Those repositories need at least a database with the schema as created in the scripts in the ./db folder. This whole repo is just for local usage.