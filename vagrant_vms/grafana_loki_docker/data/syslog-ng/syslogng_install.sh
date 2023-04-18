#!/usr/bin/env bash
set -e
set -u

apt update 
apt install -y syslog-ng
cp /vagrant_data/syslog-ng/cisco-syslog.conf /etc/syslog-ng/conf.d/cisco-syslog.conf
sudo systemctl restart syslog-ng