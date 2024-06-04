# Reverse geocoding with Nominatim

Use Nominatim to lookup address for a set of coordinates

## Setup

Download OSM file and update `docker-compose.yaml`:

```
- PBF_PATH=/data/singapore.osm.pbf
- ~/Documents/osm:/data
```

## Running

```
docker compose up
```

## Query

```
curl \
http://localhost:8080/reverse?format=json&lat=1.3119099340519775&lon=103.8887017595569 \
| python -m json.tool
```