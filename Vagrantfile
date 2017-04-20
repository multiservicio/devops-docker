# -*- mode: ruby -*-
# vi: set ft=ruby :

STATIC_IP = '10.100.10.12'
LINUX_NET_ADAPTER = 2
LINUX_NET_NAME = 'vboxnet0'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/xenial64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network 'private_network', ip: STATIC_IP, adapter: LINUX_NET_ADAPTER, name: LINUX_NET_NAME

  config.vm.provider "virtualbox" do |vb|
     vb.name = "ubuntu 16.04 LTS"
     vb.memory = (1024 * 3)
     vb.cpus = 2
     vb.linked_clone = true
  end

  # Docker provision part
  config.vm.provision :docker
  config.vm.provision :docker_compose

  config.vm.provision "shell", inline: "sysctl -w vm.max_map_count=262144", privileged: true
  config.vm.provision "shell", path: "./provision/10_run_docker.sh", privileged: false, run: "always"
  config.vm.provision "shell", path: "./provision/20_add_grafana_datasource.sh", privileged: false, run: "always"

  # Host updater
  config.hostsupdater.aliases = [
    'local.dev'
  ]

end
