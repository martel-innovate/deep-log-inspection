Dockerfiles for Deep Log Inspection
===================================
[![Documentation Status](https://readthedocs.org/projects/deep-log-inspection/badge/?version=latest)](http://deep-log-inspection.readthedocs.io/en/latest/?badge=latest)

This repository contains resources for deploying the Deep Log Inspection system in Docker Swarm.

This project is part of [FIWARE][1]. Credits to [monasca-docker][2] and [docker-elk][3].

Quick Start
-----------

To get the Deep Log Inspection system running, you can use [Docker Engine][4] in [Swarm mode][5]. Let `deeplog` be the name of the stack where we deploy all services to, then:

    docker stack deploy -c docker-compose.yml deeplog

The system is meant to be deployed on a multi-node cluster, in which the master node is accessible with a valid domain name. Let `example.com` be that domain name. Then, assuming all goes well, the following services should be exposed on the master node:

* monasca-log-api at `example.com`
* elasticsearch at `elastic.example.com`
* kibana at `kibana.example.com`

If needed, `docker stack rm deeplog` can be used to completely clean the environment between runs.

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
