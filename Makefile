
run:
	AIRPORTS_VERSION=$(AIRPORTS_VERSION) docker-compose up -d --build

build_airports:
	AIRPORTS_VERSION=$(AIRPORTS_VERSION) docker-compose build lunatech-airports

update:
	AIRPORTS_VERSION=$(AIRPORTS_VERSION) docker-compose up --no-deps -d lunatech-airports
