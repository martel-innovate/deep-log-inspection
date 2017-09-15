Dockerfiles for Deep Log Inspection
===================================
[![Documentation Status](https://readthedocs.org/projects/deep-log-inspection/badge/?version=latest)](http://deep-log-inspection.readthedocs.io/en/latest/?badge=latest)

This repository contains resources for deploying the Deep Log Inspection system in Docker Swarm.

This project is part of [FIWARE][1]. Credits to [monasca-docker][2] and [docker-elk][3].

Quick Start
-----------

To get the Deep Log Inspection system running, you can use [Docker Engine][4] in [Swarm mode][5]. In order for Elasticsearch to boot correctly, user limits must be set via [Docker configuration](./log-server/config/docker.service).

Let `deeplog` be the name of the stack where we deploy all services to, then:

    docker stack deploy -c docker-compose.yml deeplog

The system is meant to be deployed on a multi-node cluster, in which the master node is accessible with three valid domain names. Let `example.com` be the main domain name and `elastic.example.com` and `kibana.example.com` two alternative domains (in this page and throughout the full guide). Then, assuming all goes well, the following services should be exposed on the master node:

* monasca-log-api at `example.com`
* elasticsearch at `elastic.example.com`
* kibana at `kibana.example.com`
* traefik dashboard at `example.com:8080`

Optionally (for development/test):
* keystone at `example.com` on ports 5000 and 35357
    * see [`preload.yml`][3] for full account info

To bring keystone up along with the other services, deploy it to the same stack:

    docker stack deploy -c docker-compose-keystone.yml deeplog

If needed, `docker stack rm deeplog` can be used to completely clean the environment between runs.

For the full CLI reference, please refer to the [Docker CLI reference guide][6].

Repository Layout
-----------------

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
[4]:https://docs.docker.com/engine/
[5]:https://docs.docker.com/engine/swarm/
[6]:https://docs.docker.com/engine/reference/commandline/cli/
