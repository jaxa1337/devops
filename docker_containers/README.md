## How to start containers

# Example Docker Files

This repo contains simple Dockerfiles and docker-compose.yml for many apps which I used. 

All containers are simple apps for testing some function etc.

Simple commands:
- START -> `docker-compose -f ./path/to/docker-compose.yml up -d --remove-orphans --no-deps`
- STOP -> `docker-compose -f ./path/to/docker-compose.yml down`
- LOGS -> `docker-compose -f ./path/to/docker-compose.yml logs`
___
1. __DB:__
    - __Mariadb__
        ```shell
        start$ docker compose -f ./db/mariadb/docker-compose.yml --env-file ./db/mariadb/.env up -d --remove-orphans --no-deps

        stop$ docker compose -f ./db/mariadb/docker-compose.yml down
        ```

    - __MySQL__
        ```shell
        start$ docker compose -f ./db/mysql/docker-compose.yml --env-file ./db/mysql/.env up -d --remove-orphans --no-deps

        stop$ docker compose -f ./db/mysql/docker-compose.yml down
        ```

    - __PostgreSQL__
        ```shell
        start$ docker compose -f ./db/postgres/docker-compose.yml --env-file ./db/postgres/.env up -d --remove-orphans --no-deps

        attach$ docker exec -it postgres-db-1 psql {POSTGRES_DB} -U {POSTGRES_USER}

        stop$ docker compose -f ./db/postgres/docker-compose.yml down
        ```
___
2. __Linux:__
    - __Centos7__
        ```shell
        start$ docker run --rm -it -v $(pwd)/linux/centos/7/data:/data --env-file ./linux/centos/7/.env --name centos-7 $(docker build -q -f linux/centos/7/Dockerfile -t centos7 .)

        stop$ Just Ctrl+C or exit
        ```

    - __Centos8__
        ```shell
        start$ docker run --rm -it -v $(pwd)/linux/centos/8/data:/data --env-file ./linux/centos/8/.env --name centos-8 $(docker build -q -f linux/centos/8/Dockerfile -t centos8 .)

        stop$ Just Ctrl+C or exit
        ```

    - __Centos9__
        ```shell
        start$ docker run --rm -it -v $(pwd)/linux/centos/9/data:/data --env-file ./linux/centos/9/.env --name centos-9 $(docker build -q -f linux/centos/9/Dockerfile -t centos9 .)

        stop$ Just Ctrl+C or exit
        ```

    - __Ubuntu__
        
        Use Dockerfile: 
        ```shell
        start$ docker run --rm -it -v $(pwd)/linux/ubuntu/22.04/data:/data  --env-file ./linux/ubuntu/22.04/.env --name ubuntu-22.04 $(docker build -q -f linux/ubuntu/22.04/Dockerfile -t ubuntu22.04 .)

        stop$ Just Ctrl+C or exit
        ```

        Use Docker-compose:  
        ```shell  
        start$ docker compose -f ./linux/ubuntu/22.04/docker-compose.yml up -d --build --remove-orphans --no-deps

        attach_to_container$ docker exec -it ubuntu-22.04 /bin/bash

        stop$ docker compose -f ./linux/ubuntu/22.04/docker-compose.yml down
        ```

    - __Apline__

        Use Dockerfile:
        ```shell
        start$ docker run --rm -it -v $(pwd)/linux/apline/3.16/data:/data --env-file ./linux/apline/3.16/.env --name apline-3.16 $(docker build -q -f ./linux/apline/3.16/Dockerfile -t apline3.6 .)

        stop$ Just Ctrl+C or exit
        ```
___
3. __Python:__
    - __3.6.8__

        ```shell
        start$ docker run --rm --name python3.6.8 -it $(docker build -q -f python/3.6.8/Dockerfile -t python3.6.8 .)
        ```
___
4. __Monitoring:__
    - Docker Container Stats:

        Use Docker Compose:
        ```shell
        start$ docker compose -f ./monitoring/docker-container-stats/docker-compose.yml up -d --build --remove-orphans --no-deps

        attach_to_container$ docker exec -it docker-stats /bin/bash

        stop$ docker compose -f ./monitoring/docker-container-stats/docker-compose.yml down
        ```
        
    - Portainer:

        Use Docker Compose:
        ```shell
        start$ docker compose -f ./monitoring/portainer/docker-compose.yml up -d --build --remove-orphans --no-deps

        attach_to_container$ docker exec -it portainer /bin/bash

        stop$ docker compose -f ./monitoring/portainer/docker-compose.yml down
        ```
    
    - Lazy Docker:

        Use Docker Compose:
        ```shell
        start$ docker compose -f ./monitoring/lazy-docker/docker-compose.yml up -d --build --remove-orphans --no-deps

        attach_to_container$ docker exec -it lazy-docker lzd

        stop$ docker compose -f ./monitoring/lazy-docker/docker-compose.yml down
        ```
___
5. __PHP__
    - WebDevOps php-nginx-apline

        Use DockerCompose:
        ```shell
        start$ docker compose -f ./php/webdevops/php-nginx/apline/docker-compose.yml up -d --build --remove-orphans --no-deps
        
        stop$ docker compose -f ./php/webdevops/php-nginx/apline/docker-compose.yml down
        ```
___
6. __Wiki__
    - Wiki.JS
        - start: `docker compose -f ./docker_containers/wiki/wiki.js/docker-compose.yml up -d --build --remove-orphans --no-deps`
        
        - stop: `docker compose -f ./docker_containers/wiki/wiki.js/docker-compose.yml down`

    - Gollum
        - start: `docker compose -f ./docker_containers/wiki/gollum/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./docker_containers/wiki/gollum/docker-compose.yml down`
___
7. __Jenkins__
   - start: `docker compose -f ./docker_containers/jenkins/docker-compose.yml up -d --build --remove-orphans --no-deps`
   - stop: `docker compose -f ./docker_containers/jenkins/docker-compose.yml down`
   - logs: `docker compose -f ./docker_containers/jenkins/docker-compose.yml logs --tail 20 -f`
   - bash jenkins: `docker compose -f ./docker_containers/jenkins/docker-compose.yml exec -it jenkins bash`
___

8. __Nexus3__
    - start: `docker compose -f ./docker_containers/sonatype/nexus3/docker-compose.yml up -d --remove-orphans --no-deps`
    - stop: `docker compose -f ./docker_containers/sonatype/nexus3/docker-compose.yml down`
    - logs: `docker compose -f ./docker_containers/sonatype/nexus3/docker-compose.yml logs`
    - show default pass: `docker exec nexus3-nexus3-1 cat /opt/sonatype/sonatype-work/nexus3/admin.password`
___

1. __Sonarqube__
    - start: `docker compose -f ./docker_containers/sonarqube/docker-compose.yml up -d --remove-orphans --no-deps`
    - stop: `docker compose -f ./docker_containers/sonarqube/docker-compose.yml logs`
