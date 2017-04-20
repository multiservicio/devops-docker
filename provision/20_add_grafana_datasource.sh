# Apply only when container is running :-)
# inspired from https://github.com/grafana/grafana/issues/1789#issuecomment-248309442

echo "Adding influxdb datasource to grafana..."

AddDataSource() {
    sleep 10
    curl 'http://admin:admin@grafana:3000/api/datasources' \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"influxdb","type":"influxdb","url":"http://influxdb:8086","access":"proxy","isDefault":true, "database":"telegraf"}'
}

until AddDataSource; do
    echo "Adding..."
done

echo "Done!"