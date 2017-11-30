## Configuring Docker for Elasticsearch
For correctly deploying Elasticsearch, configuration of Docker must be tuned. Please refer to [Elasticsearch's official guide][1].

On Ubuntu, take the following steps:

* set the `vm_map_max_count` setting in /etc/sysctl.conf by adding the following line:

        vm.max_map_count=262144

* set user limits in /lib/systemd/system/docker.service (also see [sample configuration file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/config/docker.service)):

        LimitNOFILE=1048576
        LimitNPROC=infinity
        LimitCORE=infinity
        LimitMEMLOCK=infinity

    N.B.: this way the limits are set for the Docker daemon. To reduce memory overhead, they should be set per container (refer to the [guide][1]), but Docker Swarm might disallow this setting.

* restart the Docker daemon:

        sudo service docker restart

[1]:https://www.elastic.co/guide/en/elasticsearch/reference/5.4/docker.html
