Quick Start
-----------

To quickly get the Deep Log Inspection system running, you can use [docker-compose][1]:

    docker-compose up

Assuming all goes well, the following services should be exposed on your host
machine:

* monasca-log-api on port 8090
* elasticsearch on ports 9200 and 9300
* kibana on port 5601

Optionally (for development/test):
* keystone on ports 5000 and 35357
    + see [`preload.yml`][2] for full account info

To bring keystone up along with the other services, use both compose files:

    docker-compose -f docker-compose.yml -f docker-compose-keystone.yml up

If needed, `docker-compose rm` can be used to completely clean the environment between runs. Again, if keystone is used, include the compose files options in the command.

[1]:https://docs.docker.com/compose/
[2]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/keystone/preload.yml
