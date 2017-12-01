Dockerfiles for Deep Log Inspection
===================================
[![Documentation Status](https://readthedocs.org/projects/deep-log-inspection/badge/?version=latest)](http://deep-log-inspection.readthedocs.io/en/latest/?badge=latest)

This repository contains resources for deploying the Deep Log Inspection system in Docker Swarm.

This project is part of [FIWARE][1]. Credits to [monasca-docker][2] and [docker-elk][3].

## Quick Start

Installing and running the Deep Log Inspection system requires [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker Engine](https://www.docker.com/) in [Swarm mode](https://docs.docker.com/engine/swarm/):

1. Set up the [Docker Swarm cluster](https://docs.docker.com/get-started/part4/#create-a-cluster) where services will be deployed
2. Download the project by cloning the git repository:

        git clone https://github.com/martel-innovate/deep-log-inspection.git

3. Set user limits in Docker [configuration file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/config/docker.service). For more details, refer to the [Docker configuration section](doc/install/docker.md)
4. Create the overlay network where the services will be deployed, and the storage volumes for Elasticsearch data and logs:

        docker network create -d overlay backend
        docker volume create esdata
        docker volume create eslogs

5. Let `deeplog` be the name of the stack where we deploy all services to, then:

        docker stack deploy -c docker-compose.yml deeplog

The compose file can be found [here](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose.yml).

If needed, the environment can be completely cleaned:

    docker stack rm deeplog

For the full CLI reference, please refer to the [Docker CLI reference guide](https://docs.docker.com/engine/reference/commandline/cli/).

## Services and DNS
The system is meant to be deployed on a multi-node cluster, in which the master node is accessible with three valid names. Let `example.com` be the main name and `elastic.example.com` and `kibana.example.com` two alternative names (in this page and throughout the full guide). Then, the following services should be exposed on the master node:

* monasca-log-api at `example.com`
* elasticsearch at `elastic.example.com`
* kibana at `kibana.example.com`
* traefik dashboard at `example.com:8080`

Optionally (for development/test):

* keystone at `example.com` on ports 5000 and 35357
    * see [`preload.yml`](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/keystone/preload.yml) for full account info

To bring keystone up along with the other services, deploy it to the same stack:

    docker stack deploy -c docker-compose-keystone.yml deeplog

The compose file for keystone can be found [here](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose-keystone.yml).

## Repository Layout

 * `log-server/keystone/`: users and endpoints for test/development Keystone
 * `log-server/kibana/`: configuration for Kibana
 * `log-server/log-transformer/`: Dockerfile, configuration and pipeline for logstash-transformer
 * `log-server/log-persister/`: Dockerfile, configuration and pipeline for logstash-persister
 * `log-server/monasca-log-api/`: Dockerfile, configuration and initialization scripts for Monasca Log API
 * `log-server/scripts/`: useful bash scripts
 * `log-server/templates/`: document templates for Elasticsearch (to be created and deleted using the scripts)
 * `log-server/traefik/`: configuration file for Traefik reverse proxy
 * `log-client/monasca-log-agent/`: pipeline for remote Monasca Log Agent

[1]:https://www.fiware.org/
[2]:https://github.com/monasca/monasca-docker
[3]:https://github.com/deviantony/docker-elk
