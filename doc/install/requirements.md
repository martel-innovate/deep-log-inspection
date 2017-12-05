#### Docker version
Docker CE 17.06.0+, for compose file version 3.3.

For other compose file versions, please consult the [Compose and Docker compatibility matrix](https://docs.docker.com/compose/compose-file/#compose-and-docker-compatibility-matrix).

#### Hardware requirements (server)
The system is designed to run on a cluster (at least three nodes). Each machine should meet the following minimum requirements:

* CPU: quad-core 2.4 GHz (supported architectures depend on the OS: e.g. x86_64, armhf, and s390x for [Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/))
* RAM: 8 GB
* Disk space: 10 GB

#### Hardware requirements (agent)
The agent runs on a single host. The requirements are the same as the server.

#### Software requirements
Please consult Docker's [documentation](https://docs.docker.com/engine/installation/#supported-platforms) for the list of supported platforms and installation instructions.
