#!/usr/bin/env bash
set -e
set -u

PACKAGE_LINK="https://github.com/grafana/loki/releases/download/v2.8.0/loki-linux-amd64.zip"
CONFIG_LINK="https://raw.githubusercontent.com/grafana/loki/v2.8.0/cmd/loki/loki-local-config.yaml"
PACKAGE_PATH=/vagrant_data/loki/loki-linux-amd64.zip
CONFIG_PATH=/vagrant_data/loki/loki-local-config.yaml
SERVICE_PATH=/opt/loki/loki

function check_if_file_exist()
{
    #$1 - command to execute if file not exist
    #$2 - path to file
    if [ -e "$2" ]; then
        echo 'File already exists' >&2
    else
        eval "$1"
    fi
}

check_if_file_exist "sudo curl -o $PACKAGE_PATH -LO $PACKAGE_LINK" $PACKAGE_PATH
check_if_file_exist "sudo curl -o $CONFIG_PATH $CONFIG_LINK" $CONFIG_PATH
sudo mkdir -p /opt/loki
sudo unzip $PACKAGE_PATH -d /opt/loki/
sudo mv /opt/loki/loki-linux-amd64 $SERVICE_PATH
sudo chmod a+x $SERVICE_PATH
sudo ln -sf $SERVICE_PATH /usr/local/bin/loki
sudo cp /vagrant_data/loki/loki.service /etc/systemd/system/loki.service
sudo service loki start
sudo systemctl enable loki