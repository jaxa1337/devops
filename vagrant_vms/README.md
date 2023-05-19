# Useful vagrantfiles

This repo contain some useful Vagrantfile for all popular machines with different configurations.

## Description of individual machines
- 
## Vagrant vms structure

- [simple linux](./simple_linux/) - simple, clean distros without additional software. Fastest to run if you need clean vm.
- [bash scripting](./bash_scripting/)- runs 3 vm's (2 Centos9 and 1 Debian 11) in one private network. This stack of vms is useful for learning how to write/test scripts localy and remotely.
- [docker](./docker/) - vms with pre installed docker.
- [grafana_loki_docker](./grafana_loki_docker/) - vm with Docker, Grafana, Promtail, Loki on Ubuntu 20.04
- [netdev](./netdev/) - simple stack with 2 vms (client, server) in the same network for testing network tools
- [python](./python/) - vm to programming in python language
- [webdev](./webdev/) - vms with http server for testing web pages
- [wordpress](./wordpress/) - vm with wordpress 
## Docs
- https://www.vagrantup.com/
- https://developer.hashicorp.com/vagrant/docs
- https://app.vagrantup.com/boxes/search