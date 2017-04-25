# devops-docker

Just a bunch of services running on docker containers.

## Services

- [Grafana](local.dev:3000)
- [Influxdb](local.dev:8083)
- Telegraf
- [Jenkins](local.dev:8080)
- [Sonar](local.dev:9000)
- Registrator
- [Consul](local.dev:8500)
- [elasticsearch](local.dev:9200)


## Requirements 

- Vagrant
- Virtualbox

### Vagrant plugins

```
vagrant plugin install vagrant-hostsupdater
```

```
vagrant plugin install vagrant-docker-compose
```

## Configuration of containers

### Jenkins

In order to get the token to start the setup please follow this steps:

SSH into the vagrant machine ````vagrant ssh````

Then:

````
docker exec -it jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
````

### Grafana

This grafana set up adds a data source from a local influxdb container and add some ready made dashboards. You can see the creation of the data source in ````provision/20_add_grafana_datasource.sh```` and the premade dashboards in ````config/grafana/dashboards````. 