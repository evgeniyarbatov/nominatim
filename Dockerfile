FROM mediagis/nominatim:4.4

ENV PBF_PATH=/data/city.osm.pbf \
    REVERSE_ONLY=true \
    IMPORT_WIKIPEDIA=false \
    NOMINATIM_PASSWORD=password

WORKDIR /data

COPY city/city.osm.pbf /data

RUN chmod 644 /data/city.osm.pbf

EXPOSE 8080

CMD ["/app/start.sh"]