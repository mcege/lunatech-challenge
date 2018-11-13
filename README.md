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

### Else if you just want to run a single script and up&run the initial state:
```bash
./script_for_initial_state.sh
```

## Test

Please check the [.json file](https://github.com/mcege/lunatech-challenge/blob/master/lunatech.postman_collection.json) which had been exported from Postman, includes several GET requests for the testing purposes.

## Design decisions and chosen technologies

Docker had been chosen to run two isolated services. There is no direct access from outer world to any of those services, as well as no communication between those two services as well. As Ihad received .jar files, I thought containerizing them would be the right choice and as Docker is the most widely used containerization solution, I wanted to stick with that. [rkt](https://coreos.com/rkt/) could have been used as well.

I picked the option of reverse proxying those two servers and serve them through the 8000 port of the localhost and for that, I used Nginx. I picked Nginx, honestly because it's the web server solution with which I have the most experience and familiarity. [Traefik](https://traefik.io), [HAProxy](http://www.haproxy.org), [Apache HTTP Server](https://httpd.apache.org) are other well known alternatives for either load balancing, or reverse proxying.

For updating the airports .jar with the 1.1.0 version, I had several options such as blue/green deployment solutions with [Docker Swarm](https://docs.docker.com/engine/swarm/), or rancher-compose tool of [Rancher](https://rancher.com), but I wanted to deliver the task as simple as possible, without forcing the recipient to install even more programs, applications, etc.  

## CI/CD

I added a declarative pipeline [Jenkinsfile](https://github.com/mcege/lunatech-challenge/blob/master/Jenkinsfile), in order this to work, the countries_version should be parametrized in the docker-compose file, same as airports_version field.  

For sure, there can exist tons of other approaches here. [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) can be a solution, triggering a configuration management tool eg. [Ansible](https://www.ansible.com) through [Jenkins](https://jenkins.io), or as a step in the pipelines and let it do the docker image create&update tasks can be an another feasible approach. 
