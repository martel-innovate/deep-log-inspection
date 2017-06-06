Quick Start
-----------

To quickly get the Deep Log Inspection system running, you can use [docker-compose][1]:

    docker-compose up

Assuming all goes well, the following services should be exposed on your host
machine:

 * keystone on ports 5000 and 35357
  * see [`preload.yml`](../keystone/preload.yml) for full account info
 * monasca-log-api on port 8090
 * elasticsearch on ports 9200 and 9300
 * kibana on port 5601

If needed, `docker-compose rm` can be used to completely clean the environment
between runs.

[1]: https://docs.docker.com/compose/
