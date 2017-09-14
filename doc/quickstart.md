Quick Start
-----------

To get the Deep Log Inspection system running, you can use [Docker Engine][1] in [Swarm mode][2]. Let `deeplog` be the name of the stack where we deploy services to, then:

    docker stack deploy -c docker-compose.yml deeplog

The system is meant to be deployed on a multi-node cluster, in which the master node is accessible with a valid domain name. Let `example.com` be that domain name (in this page and throughout the full guide). Then, assuming all goes well, the following services should be exposed on the master node:

* monasca-log-api at `example.com`
* elasticsearch at `elastic.example.com`
* kibana at `kibana.example.com`

Optionally (for development/test):
* keystone at `example.com` on ports 5000 and 35357
    * see [`preload.yml`][3] for full account info

To bring keystone up along with the other services, deploy it to the same stack:

    docker stack deploy -c docker-compose-keystone.yml deeplog

If needed, `docker stack rm deeplog` can be used to completely clean the environment between runs.

For the full CLI reference, please refer to the [Docker CLI reference guide][4].

[1]:https://docs.docker.com/engine/
[2]:https://docs.docker.com/engine/swarm/
[3]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/keystone/preload.yml
[4]:https://docs.docker.com/engine/reference/commandline/cli/
