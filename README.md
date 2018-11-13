# lunatech-challenge

## Prerequisites

- docker<br/>
- docker-compose<br/>
- git<br/>
- proper connection to hub.docker.com

## Run

### First

```bash
git clone https://github.com/mcege/lunatech-challenge.git
docker network create lunatech
cd lunatech-challenge
```

### If docker-compose is fine:

```bash
# Pay attention to the AIRPORTS_VERSION variable
AIRPORTS_VERSION=1.0.1 docker-compose up -d --build
AIRPORTS_VERSION=1.1.0 docker-compose build lunatech-airports
# Update the running lunatech-airports docker image w'out effecting... 
# ...neither of nginx, or lunatech-countries containers
AIRPORTS_VERSION=1.1.0 docker-compose up --no-deps -d lunatech-airports
```

### Else if you are a make enthusiast:

```bash
# Pay attention to the AIRPORTS_VERSION variable
make run AIRPORTS_VERSION=1.0.1
make build_airports AIRPORTS_VERSION=1.1.0
# Update the running lunatech-airports docker image w'out effecting...
# ...neither of nginx, or lunatech-countries containers
make update AIRPORTS_VERSION=1.1.0
```

### Else if you just want to run a single script and up&run the initial state:
```bash
chmod +x script_for_initial_state.sh && ./script_for_initial_state.sh
```

## Test

Please check [.json](https://github.com/mcege/lunatech-challenge/blob/master/lunatech.postman_collection.json) which had been exported from Postman, includes several GET requests for the testing purposes.
