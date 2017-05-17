Dockerfiles for Monasca Log API - ELK stack
===========================================

This repository contains resources for building and deploying a full
Monasca Log API - ELK stack in Docker.

The projects [monasca-docker][2] and [docker-elk][3] served as a basis for the current project.

The project is part of [FIWARE][1].

Quick Start
-----------

To quickly get a Monasca environment running, you can use [docker-compose][4]:

    docker-compose up

Assuming all goes well, the following services should be exposed on your host
machine:

 * keystone on ports 5000 and 35357
  * see [`preload.yml`][5] for full account info
 * monasca-log-api on port 8090
 * elasticsearch on ports 9200 and 9300
 * kibana on port 5601

If needed, `docker-compose rm` can be used to completely clean the environment
between runs.

Repository Layout
-----------------

 * `elasticsearch/` Dockerfile for Elasticsearch
 * `kibana/`: Dockerfile for kibana
 * `logstash-transformer/`: Dockerfile for logstash-transformer
 * `logstash-persister/`: Dockerfile for logstash-persister
 * `monasca-log-api/`: Dockerfile for Monasca Log API
 * `scripts/`: useful bash scripts
 * `syslogVM/`: Dockerfile and logstash.conf for remote syslog server
 * `templates/`: document templates for Elasticsearch (to be created and deleted using the scripts)


A number of custom dependency containers are also here:

 * `kafka/`: Dockerfile for k8s-compatible kafka
 * `keystone/`: Dockerfile for dev keystone

[1]: https://www.fiware.org/
[2]: https://github.com/monasca/monasca-docker
[3]: https://github.com/deviantony/docker-elk
[4]: https://docs.docker.com/compose/
[5]: https://github.com/martel-innovate/deep-log-monasca-elk/blob/master/keystone/preload.yml