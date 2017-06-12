Dockerfiles for Deep Log Inspection
===================================
[![Documentation Status](https://readthedocs.org/projects/deep-log-inspection/badge/?version=latest)](http://deep-log-inspection.readthedocs.io/en/latest/?badge=latest)

This repository contains resources for building and deploying the Deep Log Inspection system in Docker.

This project is part of [FIWARE][1]. Credits to [monasca-docker][2] and [docker-elk][3].

Quick Start
-----------

To quickly get the Deep Log Inspection server running, `cd` into `log-server` and use [docker-compose][4]:

    docker-compose up

Assuming all goes well, the following services should be exposed on your host
machine:

 * monasca-log-api on port 8090
 * elasticsearch on ports 9200 and 9300
 * kibana on port 5601

If needed, `docker-compose rm` can be used to completely clean the environment between runs.

Repository Layout
-----------------

 * `log-server/elasticsearch/` Dockerfile for Elasticsearch
 * `log-server/kibana/`: Dockerfile for kibana
 * `log-server/logstash-transformer/`: Dockerfile for logstash-transformer
 * `log-server/logstash-persister/`: Dockerfile for logstash-persister
 * `log-server/monasca-log-api/`: Dockerfile for Monasca Log API
 * `log-server/scripts/`: useful bash scripts
 * `log-server/templates/`: document templates for Elasticsearch (to be created and deleted using the scripts)
 * `log-client/monasca-log-agent/`: Dockerfile and logstash.conf for remote Monasca Log Agent


A number of custom dependency containers are also here:

 * `log-server/kafka/`: Dockerfile for k8s-compatible kafka
 * `log-server/keystone/`: Dockerfile for development keystone

[1]: https://www.fiware.org/
[2]: https://github.com/monasca/monasca-docker
[3]: https://github.com/deviantony/docker-elk
[4]: https://docs.docker.com/compose/
[5]:http://deep-log-inspection.readthedocs.io/
