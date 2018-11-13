# lunatech-challenge

AIRPORTS_VERSION=1.0.1 docker-compose up -d --build
AIRPORTS_VERSION=1.1.0 docker-compose build lunatech-airports
AIRPORTS_VERSION=1.1.0 docker-compose up --no-deps -d lunatech-airports
