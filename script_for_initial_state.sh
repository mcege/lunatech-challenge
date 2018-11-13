#! /bin/sh
docker network inspect lunatech &>/dev/null || docker network create lunatech \
&& AIRPORTS_VERSION=1.0.1 docker-compose up -d --build
