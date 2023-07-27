#!/usr/bin/env bash

set -u
set -e
DOCKER_PATH=$1
MAX_PERCENT=$2
USED_DISK_SPACE=$(df -ah | grep -E "${DOCKER_PATH}$" | awk '{print $5}' | sed 's/%//g')

echo "####################################################"
echo "=====${USED_DISK_SPACE}% of disk space (${DOCKER_PATH}) is in use"

if [[ $USED_DISK_SPACE -ge $MAX_PERCENT ]]; then
        echo "####################################################"
        echo "=====Starting 'docker system prune' command ..."
        docker system prune -f
        if [[ $? != 0 ]]; then
                echo "=====Something went wrong!"
                echo "=====Please check logs from docker engine!"
        else
                echo "####################################################"
                echo "=====Cleaning complete!"
                DISK_SPACE_AFTER_CLEAN_UP=$(df -ah | grep -E "${DOCKER_PATH}$" | awk '{print $5}' | sed 's/%//g')
                echo "=====Now the parition  ($DOCKER_PATH) has $((100-${DISK_SPACE_AFTER_CLEAN_UP}))% free space"
        fi;
else
        echo "####################################################"
        echo "=====Nothing to clean";
fi;

echo "####################################################"