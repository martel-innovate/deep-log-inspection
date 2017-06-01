## Configuring the Monasca Log API
The Monasca Log API runs on top of a [`gunicorn`][1] server. For a minimal configuration, a few settings have to be tuned in the following files:
* `docker-compose.yml`
* `monasca-log-api/log-api-config.ini.j2`
* `monasca-log-api/log-api-config.conf.j2`
* `monasca-log-api/Dockerfile`

In the `compose` file, look up the service block named `monasca-log-api`. Here you might want to edit the `ports` the server listens to on both the host and the container (default is `8090`: change this value carefully, updating it also in `log-api-config.ini.j2`, in the `server:main` section, and in `logstash.conf` on the [Monasca Log Agent][2], in the `output` section of the pipeline). Also, the `restart` policy of the service is set to `on-failure` to guarantee the service stays up. You might want to [edit][3] this value or even remove this setting.

In `log-api-config.ini`, the main settings are the `host` IP address and `port` the `gunicorn` server should listen to, as well as the number of working processes (`workers`) for handling requests, the maximum number of simultaneous clients (`worker-connections`), and the maximum number of pending connections (`backlog`). Please refer to the [settings][4] reference in the [documentation][1] of `gunicorn`.

In `log-api-config.conf`, the relevant settings are: the `region` (in the `service` section), that will be added to the logs as metadata; in the `log_publisher` section, the Kafka topic (`topics`) to which the logs are published and the address of the Kafka broker (`kafka_url`); in the `keystone_authtoken` section are the address of the Keystone and the credentials for authentication. It might also be necessary to set the roles (`default_roles`, `agent_roles`) in the `roles_middleware` section.

Finally, note that whenever a field has for value a name in capital letters enclosed in double curly brackets (e.g. `port = {{ API_PORT }}`), this name is an environment variable. To keep the settings clean and consistent, change the value of environment variables in the [Dockerfile][5].

[1]:http://docs.gunicorn.org/en/stable/
[2]:https://github.com/martel-innovate/deep-log-monasca-elk/blob/master/doc/manuals/install/6-monasca-log-agent.md
[3]:https://docs.docker.com/compose/compose-file/compose-file-v2/#restart
[4]:http://docs.gunicorn.org/en/latest/settings.html
[5]:https://github.com/martel-innovate/deep-log-monasca-elk/blob/master/monasca-log-api/Dockerfile
