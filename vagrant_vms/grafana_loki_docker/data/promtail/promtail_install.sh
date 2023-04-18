#!/usr/bin/env bash
set -e
set -u

PACKAGE_LINK="https://github.com/grafana/loki/releases/download/v2.8.0/promtail-linux-amd64.zip"
CONFIG_LINK="https://raw.githubusercontent.com/grafana/loki/v2.8.0/clients/cmd/promtail/promtail-local-config.yaml"
PACKAGE_PATH=/vagrant_data/promtail/promtail-linux-amd64.zip
CONFIG_PATH=/vagrant_data/promtail/promtail-local-config.yaml
SERVICE_PATH=/opt/promtail/promtail

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
sudo mkdir -p /opt/promtail
sudo unzip $PACKAGE_PATH -d /opt/promtail/
sudo mv /opt/promtail/promtail-linux-amd64 $SERVICE_PATH
sudo chmod a+x $SERVICE_PATH
sudo ln -s $SERVICE_PATH /usr/local/bin/promtail
sudo cp /vagrant_data/promtail/promtail.service /etc/systemd/system/promtail.service
sudo service promtail start
sudo systemctl enable promtail 