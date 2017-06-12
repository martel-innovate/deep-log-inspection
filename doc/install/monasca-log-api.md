## Configuring the Monasca Log API
The Monasca Log API runs on top of a [gunicorn][1] server. For a minimal configuration, a few settings have to be tuned in the following files:
* [docker-compose.yml][4]
* [monasca-log-api/Dockerfile][5]
* [monasca-log-api/log-api-config.ini.j2][6]
* [monasca-log-api/log-api-config.conf.j2][7]

#### docker-compose file
In _docker-compose.yml_, look up the service named 'monasca-log-api'. Here you might want to edit the `ports` the server listens to on both the host and the container (default is `8090`: change this value carefully, updating it also in the `server:main` section of _log-api-config.ini.j2_ and in the `output` section of _logstash.conf_ on the [Monasca Log Agent](monasca-log-agent.md)). Also, the `restart` policy of the service is set to `on-failure` to guarantee the service stays up. You might want to [edit][2] this value or even remove this setting.

#### Dockerfile & Enviroment Variables
Note that in the configuration files referenced in the following paragraphs, whenever a field has for value a name in capital letters enclosed in double curly brackets (e.g. `port = {{ API_PORT }}`), this name is an environment variable. To keep the settings clean and consistent, change the value of environment variables in the [Dockerfile][5] (but also in [docker-compose.yml][4] and [docker-compose-kestone.yml][9]).

#### Other configuration files
In *log-api-config.ini*, the main settings are the `host` IP address and `port` the gunicorn server should listen to, as well as the number of working processes (`workers`) for handling requests, the maximum number of simultaneous clients (`worker-connections`), and the maximum number of pending connections (`backlog`). Please refer to the [settings][3] section in [gunicorn's documentation][1].

In *log-api-config.conf*, the relevant settings are: the `region` (in the `service` section), that will be added to the logs as metadata; in the `log_publisher` section, the Kafka `topics` to which the logs are published and the address of the Kafka broker (`kafka_url`).

#### Authenticating to Keystone
In *log-api-config.conf*, the `keystone_authtoken` section allows to set the address of the Keystone and the credentials for authentication. It might also be necessary to set the roles (`default_roles`, `agent_roles`) in the `roles_middleware` section.

Authentication can be done to either the local (development/test) or the central Keystone (recommended).
Here follow the environment settings to be inserted in the [Dockerfile][5] for authenticating to the local Keystone:

    ENV KEYSTONE_IDENTITY_URI=http://keystone:35357 \
	    KEYSTONE_AUTH_URI=http://keystone:5000 \
	    KEYSTONE_ADMIN_USER=admin \
	    KEYSTONE_ADMIN_PASSWORD=secretadmin \
	    KEYSTONE_ADMIN_TENANT=admin

For local authentication, please consult the account information in [keystone/preload.yml][8]. For authentication to the central Keystone, please contact the FIWARE Lab administrators.

[1]:http://docs.gunicorn.org/en/stable/
[2]:https://docs.docker.com/compose/compose-file/compose-file-v2/#restart
[3]:http://docs.gunicorn.org/en/latest/settings.html
[4]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose.yml
[5]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/monasca-log-api/Dockerfile
[6]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/monasca-log-api/config/log-api-config.ini.j2
[7]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/monasca-log-api/log-api-config.conf.j2
[8]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/keystone/preload.yml
[9]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose-keystone.yml
