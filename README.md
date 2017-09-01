Dockerfiles for Deep Log Inspection
===================================
[![Documentation Status](https://readthedocs.org/projects/deep-log-inspection/badge/?version=latest)](http://deep-log-inspection.readthedocs.io/en/latest/?badge=latest)

This repository contains resources for building and deploying the Deep Log Inspection system in Docker Compose.

This project is part of [FIWARE][1]. Credits to [monasca-docker][2] and [docker-elk][3].

Quick Start
-----------

To quickly get the Deep Log Inspection server running, `cd` into `log-server` and use [docker-compose][4]:

    docker-compose up

Assuming all goes well, the following services should be exposed on your host
machine:

 * monasca-log-api on port 443
 * elasticsearch on port 9200
 * kibana on port 80

If needed, `docker-compose rm` can be used to completely clean the environment between runs.

Repository Layout
-----------------

 * `log-server/keystone/`: users and endpoints for test/development Keystone
 * `log-server/kibana/`: configuration for Kibana
 * `log-server/logstash-transformer/`: Dockerfile, configuration and pipeline for logstash-transformer
 * `log-server/logstash-persister/`: Dockerfile, configuration and pipeline for logstash-persister
 * `log-server/monasca-log-api/`: Dockerfile, configuration and initialization scripts for Monasca Log API
 * `log-server/scripts/`: useful bash scripts
 * `log-server/templates/`: document templates for Elasticsearch (to be created and deleted using the scripts)
 * `log-client/monasca-log-agent/`: pipeline for remote Monasca Log Agent

[1]: https://www.fiware.org/
[2]: https://github.com/monasca/monasca-docker
[3]: https://github.com/deviantony/docker-elk
[4]: https://docs.docker.com/compose/
[5]:http://deep-log-inspection.readthedocs.io/
