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

#### Jenkinsfile

This repo includes a ````jenkinsfile```` with the idea of testing the pipelines and the sonar-influxdb-grafana integration

#### Jenkins plugins

- Influxdb
- SonarQube Scanner for Jenkins	
- BlueOcean (new pipelines interface)

#### Jenkins InfluxDB plugin installation (manual)

In order to get jenkins metrics (about build status) pushed to influx you have to install the influxdb jenkins plugin. Unfortunatelly it has a dependency issue with another plugin (performance).
You can track the open issue [here](https://issues.jenkins-ci.org/browse/JENKINS-43539?page=com.atlassian.jira.plugin.system.issuetabpanels%3Achangehistory-tabpanel)

In order to avoid this conflic you must install manually first the performance plugin (available in the ````config/jenkins/plugins```` folder as performance.hpi) and then the influxdb plugin (also available in same path).

Information about the pluging [here](https://wiki.jenkins-ci.org/display/JENKINS/InfluxDB+Plugin)

### Grafana

This grafana set up adds a data source from a local influxdb container and add some ready made dashboards. You can see the creation of the data source in ````provision/20_add_grafana_datasource.sh```` and the premade dashboards in ````config/grafana/dashboards````. 

### Sonar

Sonar will be use here with an example code. You can find the project [here](https://github.com/SonarSource/sonar-examples)

The ````properties```` file is on the root path of this repository and is thought with the idea of the dummy that lives on the ````helloworld```` folder.