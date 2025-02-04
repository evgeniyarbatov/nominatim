IMAGE_TAG = local-nominatim

IMAGE_PORT = 8002
SERVER_PORT = 8080

OSM_URL = https://download.geofabrik.de/asia/vietnam-latest.osm.pbf

OSM_DIR = country
OSM_PATH = $(OSM_DIR)/$(notdir $(OSM_URL))

all: city run

osm:
	if [ ! -f $(OSM_PATH) ]; then \
		wget $(OSM_URL) -P $(OSM_DIR); \
	fi

city: osm
	if [ ! -f city/city.osm.pbf ]; then \
		osmconvert $(OSM_PATH) -B=city/polygon.poly -o=city/city.osm.pbf; \
	fi

docker:
	open -a Docker
	while ! docker info > /dev/null 2>&1; do \
		sleep 1; \
	done
	
run: docker
	docker rm -f $(IMAGE_TAG) >/dev/null 2>&1
	docker build --quiet -t $(IMAGE_TAG) . >/dev/null 2>&1
	docker run -p $(IMAGE_PORT):$(SERVER_PORT) --name $(IMAGE_TAG) -d $(IMAGE_TAG) >/dev/null 2>&1

query:
	@curl \
	-s \
	"http://localhost:$(IMAGE_PORT)/reverse?format=json&lat=20.994827389282687&lon=105.86761529483299" \
	| python -m json.tool

.PHONY: city