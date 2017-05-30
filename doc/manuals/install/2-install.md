## Installing with docker-compose
Installing and running the Deep Log Inspection system requires [git][1] and [docker][2], so make sure they are installed on your system before proceeding.

Open your system's command line and `cd` to the folder where the project will be stored. Then, download the project by cloning the git repository:

    git clone https://github.com/martel-innovate/deep-log-monasca-elk.git

To install and run the system, please refer to the [README][3]. For your convenience, you might want to run the system in detached mode:

    docker-compose up -d

For all other commands, including stopping, restarting and rebuilding the system, please refer to the [docker-compose documentation][4].

[1]:https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[2]:https://www.docker.com/
[3]:https://github.com/martel-innovate/deep-log-monasca-elk/blob/master/README.md
[4]:https://docs.docker.com/compose/
