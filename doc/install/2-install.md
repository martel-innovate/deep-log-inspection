## Installing & Deploying
Installing and running the Deep Log Inspection system requires [git][1] and [docker][2], so make sure they are installed on your system before proceeding.

Open your system's command line and `cd` to the folder where the project will be stored. Then, download the project by cloning the git repository:

    git clone https://github.com/martel-innovate/deep-log-monasca-elk.git

To install and run the system, also refer to the [Quick Start guide](../2-quickstart.md). For your convenience, you might want to run the system in detached mode:

    docker-compose up -d

After the first run, there's no more need to `docker-compose up` again, unless `docker-compose down` is invoked, destroying all services.

Once the system is up and running, you can restart, stop and start:

    docker-compose restart
    docker-compose stop
    docker-compose start

In case of changes to some Dockerfiles, you might want to rebuild only the modified services:

    docker-compose up -d --build

To visualize information about the running services, including name, state and ports:

    docker-compose ps

For all other docker-compose commands, please refer to the [docker-compose documentation][4].

[1]:https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[2]:https://www.docker.com/
[4]:https://docs.docker.com/compose/
