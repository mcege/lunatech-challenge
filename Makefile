
run:
	AIRPORTS_VERSION=$(airports_version) docker-compose up -d --build

build_airports:
	AIRPORTS_VERSION=$(airports_version) docker-compose build lunatech-airports

update:
	AIRPORTS_VERSION=$(airports_version) docker-compose up --no-deps -d lunatech-airports
