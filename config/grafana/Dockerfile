FROM grafana/grafana:latest
RUN apt-get clean \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && apt-get autoremove -y \ 
    && rm -rf /var/lib/apt/lists/*

COPY datasources.sh /usr/local/bin/
RUN datasources.sh