# lunatech-challenge

## Prerequisite

- docker<br/>
- docker-compose<br/>
- git
- proper connection to hub.docker.com

## Run

```bash
git clone https://github.com/mcege/lunatech-challenge.git
docker network create lunatech
# Pay attention to the AIRPORTS_VERSION variable
AIRPORTS_VERSION=1.0.1 docker-compose up -d --build
AIRPORTS_VERSION=1.1.0 docker-compose build lunatech-airports
# Update the running lunatech-airports docker image w'out effecting... 
# ...neither of nginx, or lunatech-countries containers
AIRPORTS_VERSION=1.1.0 docker-compose up --no-deps -d lunatech-airports
```

## Test

Please check [.json](https://github.com/mcege/lunatech-challenge/blob/master/lunatech.postman_collection.json) which had been exported from Postman, includes several GET requests for the testing purposes.
