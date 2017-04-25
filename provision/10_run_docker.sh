#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

containers=$(docker ps -aq)
if [ ! -z "$containers" ]; then
    echo "Removing containers"
    docker rm -f $containers
fi

echo "Rebuilding images"
# Uncomment different docker-compose to build different stacks
# docker-compose -f /vagrant/config/docker-compose-other.yml build
# docker-compose -f /vagrant/config/docker-compose-elk.yml build
docker-compose -f /vagrant/config/docker-compose.yml build

echo "Starting containers"
# Uncomment different docker-compose to build different stacks
# docker-compose -f /vagrant/config/docker-compose-other.yml up -d --force-recreate
# docker-compose -f /vagrant/config/docker-compose-elk.yml up -d --force-recreate
docker-compose -f /vagrant/config/docker-compose.yml up -d --force-recreate