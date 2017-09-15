## Installing & Deploying
Installing and running the Deep Log Inspection system requires [git][1] and [docker][2], so make sure they are installed on your system before proceeding. In order for Elasticsearch to boot correctly, user limits must be set via [Docker configuration][5].

Open your system's command line and `cd` to the folder where the project will be stored. Then, download the project by cloning the git repository:

    git clone https://github.com/martel-innovate/deep-log-inspection.git

To install and run the system, also refer to the [Quick Start guide](../quickstart.md).

First, create the overlay network where the services will be deployed:

    docker network create -d overlay backend

Deploy the system with [Docker Swarm][3]:

    docker stack deploy -c docker-compose.yml deeplog

In development/test environment, you might want to start also keystone:

    docker stack deploy -c docker-compose-keystone.yml deeplog

Once the system is up and running, you can apply later changes to a service, e.g.:

    docker service update deeplog_elasticsearch

or reload all services by redeploying the system, just like the first time:

    docker stack deploy -c docker-compose.yml deeplog

To visualize information about the running services, including name and ports:

    docker service ls

For the full CLI reference, please refer to the [Docker CLI reference guide][4].

[1]:https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[2]:https://www.docker.com/
[3]:https://docs.docker.com/engine/swarm/
[4]:https://docs.docker.com/engine/reference/commandline/cli/
[5]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/config/docker.service
