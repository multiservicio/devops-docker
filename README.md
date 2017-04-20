# devops-docker

Just a bunch of services running on docker containers.

## Services

- Grafana
- Influxdb
- Telegraf
- Jenkins
- Sonar
- Registrator
- Consul


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

SSH into the vagrant machine ```vagrant ssh````

Then:

````
docker exec -it jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
````