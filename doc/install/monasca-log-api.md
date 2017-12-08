## Configuring the Monasca Log API
The Monasca Log API (docker image [here](https://hub.docker.com/r/martel/monasca-log-api/)) runs on top of a [gunicorn](http://docs.gunicorn.org/en/latest/) server. Settings can be tuned via environment variables and deployment options in the [compose file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose.yml) (look up the service named 'monasca-log-api').

#### Enviroment variables
| Setting | Description | Value |
| --- | --- | --- |
| `CONFIG_TEMPLATE` | use Jinja2 configuration template \* | `true` |
| `LOG_LEVEL_ROOT` | the level of the root logger | `INFO` |
| `LOG_LEVEL_CONSOLE` | minimum level for console output | `INFO` |
| `MONASCA_CONTAINER_LOG_API_PORT` | the Log API's HTTP port | `8090` |
| `KAFKA_URI` | the host and port for kafka | `kafka:9092` |
| `KAFKA_WAIT_FOR_TOPICS` | topics to wait on at startup | `monasca-log,logstash-log` |
| `KAFKA_WAIT_RETRIES` | number of kafka wait attempts | `24` |
| `KAFKA_WAIT_DELAY` | seconds to wait between attempts | `5` |
| `KEYSTONE_IDENTITY_URI` | keystone identity address | `http://keystone:35357` |
| `KEYSTONE_AUTH_URI` | keystone auth address | `http://keystone:5000` |
| `KEYSTONE_ADMIN_USER` | keystone admin account user | `admin` |
| `KEYSTONE_ADMIN_PASSWORD` | keystone admin account password | `secretadmin` |
| `KEYSTONE_ADMIN_TENANT` | keystone admin account tenant | `admin` |
| `KEYSTONE_ADMIN_DOMAIN` | keystone admin domain | `default` |
| `AUTHORIZED_ROLES` | roles for admin users | `monasca-log-api` |
| `AGENT_AUTHORIZED_ROLES` | roles for metric write only users | `monasca-log-agent` |
| `GUNICORN_WORKERS` | number of API worker processes | `9` |
| `GUNICORN_WORKER_CLASS` | async worker class | `gevent` |
| `GUNICORN_WORKER_CONNECTIONS` | number of connections for async worker | `2000` |
| `GUNICORN_BACKLOG` | gunicorn backlog size | `1000` |
| `GUNICORN_TIMEOUT` | gunicorn timeout | `1000` |
| `MAX_MESSAGE_SIZE` | maximum size of log message in bytes | `1000012` |
| `LOG_PUBLISHER_TOPIC` | kafka topic to which logs are published | `monasca-log` |
| `KAFKA_HEALTH_TOPIC` | kafka healthcheck topic | `kafka-health` |
| `REGION` | region of the service | `switzerland` |

\* If jinja2 formatting is not desired, the environment variable CONFIG_TEMPLATE
can be set to false. Note that the jinja2 template should still be overwritten
(rather than the target file without the .j2 suffix) as it will be copied at
runtime (see [start.sh](https://github.com/monasca/monasca-docker/blob/master/monasca-log-api/start.sh)).

#### Deployment options
| Setting | Description | Value |
| --- | --- | --- |
| `labels: traefik.port` | The port the service listens to. Must match `MONASCA_CONTAINER_LOG_API_PORT` | `8090` |
| `restart_policy: condition` | The restart policy in case of service failure | `on-failure` |

#### Authenticating to Keystone
Authentication can be done to either the local (development/test) or the central Keystone (recommended).

For local authentication, refer to the above table and to [keystone/preload.yml](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/keystone/preload.yml). For authentication to the central Keystone, please contact the FIWARE Lab administrators.
