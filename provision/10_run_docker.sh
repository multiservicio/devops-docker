#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

containers=$(docker ps -aq)
if [ ! -z "$containers" ]; then
    echo "Removing containers"
    docker rm -f $containers
fi

echo "Rebuilding images"
docker-compose -f /vagrant/config/docker-compose.yml build

echo "Starting containers"
docker-compose -f /vagrant/config/docker-compose.yml up -d --force-recreate