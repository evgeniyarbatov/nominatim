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
"http://localhost:8080/reverse?format=json&lat=1.3119099340519775&lon=103.8887017595569" \
-o - \
| python3 -m json.tool
{
    "place_id": 322426,
    "licence": "Data \u00a9 OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright",
    "osm_type": "way",
    "osm_id": 728837248,
    "lat": "1.3119091295765686",
    "lon": "103.88869812522394",
    "display_name": "Lorong 36 Geylang, Geylang, Southeast, Singapore, 399772, Singapore",
    "address": {
        "road": "Lorong 36 Geylang",
        "suburb": "Geylang",
        "city_district": "Southeast",
        "ISO3166-2-lvl6": "SG-04",
        "city": "Singapore",
        "postcode": "399772",
        "country": "Singapore",
        "country_code": "sg"
    },
    "boundingbox": [
        "1.3118469",
        "1.3121883",
        "103.8886472",
        "103.8887119"
    ]
}
```