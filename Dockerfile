FROM elasticsearch:8.16.0
LABEL org.opencontainers.image.source="https://github.com/occrp/alfred-elasticsearch"

RUN bin/elasticsearch-plugin install --batch analysis-icu

COPY k8s-entrypoint.sh /k8s-entrypoint.sh
COPY --chown=elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY --chown=elasticsearch synonames.txt     /usr/share/elasticsearch/config/

ENTRYPOINT [ "/k8s-entrypoint.sh" ]
