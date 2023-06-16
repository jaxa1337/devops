## How to start containers

# Example Docker Files

This repo contains simple Dockerfiles and docker-compose.yml for many apps which I used. 

All containers are simple apps for testing some functions etc.

Simple commands:
- START -> `docker-compose -f ./path/to/docker-compose.yml up -d --remove-orphans --no-deps`
- STOP -> `docker-compose -f ./path/to/docker-compose.yml down`
- LOGS -> `docker-compose -f ./path/to/docker-compose.yml logs`
- EXEC -> `docker-compose -f ./path/to/docker-compose.yml exec SERVICE COMMANDS`
___
1. __DB:__ 

    For all dbs you can choose version of them in `./db/DB_TYPE/.env` file. 
    Example for mariadb: [`./db/mariadb/.env`](./db/mariadb/.env)

    __Adminer__ service is available under 8888 port. 

    - __Mariadb__ 
        - start: `docker compose -f ./db/mariadb/docker-compose.yml up -d --remove-orphans --no-deps`
        - stop: `docker compose -f ./db/mariadb/docker-compose.yml down`
        - client: `docker compose -f ./db/mariadb/docker-compose.yml exec db mysql -h 127.0.0.1 -u test -ptest testowa`

    - __MySQL__ 
        - start: `docker compose -f ./db/mysql/docker-compose.yml up -d --remove-orphans --no-deps`
        - stop: `docker compose -f ./db/mysql/docker-compose.yml down`
        - client: `docker compose -f ./db/mysql/docker-compose.yml exec db mysql -h 127.0.0.1 -u test -ptest testowa`

    - __PostgreSQL__ 
        - start: `docker compose -f ./db/postgres/docker-compose.yml up -d --remove-orphans --no-deps`
        - stop: `docker compose -f ./db/postgres/docker-compose.yml down`
        - client: `docker compose -f ./db/postgres/docker-compose.yml exec db psql testowa -U test`
___
1. __Linux:__
   
    If you want put some data in system, put these data in `./linux/DISTRO/OS_VERSION/data`.
    - __Centos__ 

        Change in all commands `OS_VERSION`. Available os versions: __`7, 8, 9`__. 
        - start: `docker compose -f ./linux/centos/OS_VERSION/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./linux/centos/OS_VERSION/docker-compose.yml down`
        - cli: `docker compose -f ./linux/centos/OS_VERSION/docker-compose.yml exec os bash`

    - __Ubuntu__ 

        Change in all commands `OS_VERSION`. Available os versions: __`22.04`__.
        - start: `docker compose -f ./linux/ubuntu/OS_VERSION/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./linux/ubuntu/OS_VERSION/docker-compose.yml down`
        - cli: `docker compose -f ./linux/ubuntu/OS_VERSION/docker-compose.yml exec os bash`

    - __Debian__ 

        Change in all commands `OS_VERSION`. Available os versions: __`12`__.
        - start: `docker compose -f ./linux/debian/OS_VERSION/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./linux/debian/OS_VERSION/docker-compose.yml down`
        - cli: `docker compose -f ./linux/debian/OS_VERSION/docker-compose.yml exec os bash`
  
    - __Apline__ 

        Change in all commands `OS_VERSION`. Available os versions: __`3.16`__.
        - start: `docker compose -f ./linux/alpine/OS_VERSION/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./linux/alpine/OS_VERSION/docker-compose.yml down`
        - cli: `docker compose -f ./linux/alpine/OS_VERSION/docker-compose.yml exec os bash`
  
___
1. __Python:__
   
   Please choos python version in [`docker_containers/python/.env`](./python/.env)!. 
   File [`entrypoint.sh`](./python/entrypoint.sh) contain `pip install` command and after instalation libraries, container fall asleep.

    - start: `docker compose -f ./python/docker-compose.yml up -d --remove-orphans --no-deps`
    - stop: `docker compose -f ./python/docker-compose.yml down`
    - python: `docker compose -f ./python/docker-compose.yml exec cli python`
___
1. __Monitoring:__

    All monitoring tools must be connected to `docker.sock`. Path to this sock is different on Linux and Windows, choose right env `DOCKER_SOCK`
    in __`./monitoring/MONITORING/.env`__. 

    Default dashboards are available under `localhost:${HOST_PORT:-8889}`

    - Docker Container Stats:

        - start: `docker compose -f ./monitoring/docker_stats/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./monitoring/docker_stats/docker-compose.yml down`
        - cli: `docker compose -f ./monitoring/docker_stats/docker-compose.yml exec monitor bash`
        
    - Portainer:

        - start: `docker compose -f ./monitoring/portainer/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./monitoring/portainer/docker-compose.yml down`
        - cli: `docker compose -f ./monitoring/portainer/docker-compose.yml exec monitor bash`
    
    - Lazy Docker:

        Doesn't have dashboard, you must run `lzd` proccess. Use `run_lzd` command.

        - start: `docker compose -f ./monitoring/lazy_docker/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./monitoring/lazy_docker/docker-compose.yml down`
        - run_lzd: `docker compose -f ./monitoring/lazy_docker/docker-compose.yml exec monitor lzd`
___
1. __PHP__
    - WebDevOps php-nginx-apline

        Use DockerCompose:
        - start: `docker compose -f ./php/webdevops/php-nginx/apline/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./php/webdevops/php-nginx/apline/docker-compose.yml down`
___
1. __Wiki__
    - Wiki.JS
        - start: `docker compose -f ./docker_containers/wiki/wiki.js/docker-compose.yml up -d --build --remove-orphans --no-deps`
        
        - stop: `docker compose -f ./docker_containers/wiki/wiki.js/docker-compose.yml down`

    - Gollum
        - start: `docker compose -f ./docker_containers/wiki/gollum/docker-compose.yml up -d --build --remove-orphans --no-deps`
        - stop: `docker compose -f ./docker_containers/wiki/gollum/docker-compose.yml down`
___
1. __Jenkins__
   - start: `docker compose -f ./docker_containers/jenkins/docker-compose.yml up -d --build --remove-orphans --no-deps`
   - stop: `docker compose -f ./docker_containers/jenkins/docker-compose.yml down`
   - logs: `docker compose -f ./docker_containers/jenkins/docker-compose.yml logs --tail 20 -f`
   - cli: `docker compose -f ./docker_containers/jenkins/docker-compose.yml exec jenkins bash`
___

1. __Nexus3__
    - start: `docker compose -f ./docker_containers/sonatype/nexus3/docker-compose.yml up -d --remove-orphans --no-deps`
    - stop: `docker compose -f ./docker_containers/sonatype/nexus3/docker-compose.yml down`
    - logs: `docker compose -f ./docker_containers/sonatype/nexus3/docker-compose.yml logs`
    - show default pass: `docker exec nexus3-nexus3-1 cat /opt/sonatype/sonatype-work/nexus3/admin.password`
___

1. __Sonarqube__
    - start: `docker compose -f ./docker_containers/sonarqube/docker-compose.yml up -d --remove-orphans --no-deps`
    - stop: `docker compose -f ./docker_containers/sonarqube/docker-compose.yml logs`
