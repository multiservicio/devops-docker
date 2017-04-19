#!/bin/bash -e

echo 'Starting Grafana...'
/run.sh "$@" &
AddDataSource() {
  curl 'http://grafana:3000/api/datasources' \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"influxdb","type":"influxdb","url":"http://influxdb:80806","access":"proxy","isDefault":true}'
}
until AddDataSource; do
  echo 'Configuring Grafana: Adding influxdb data source...'
  sleep 1
done
echo 'Done!'
wait