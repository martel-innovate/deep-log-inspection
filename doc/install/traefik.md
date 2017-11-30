## Traefik
[Traefik](https://docs.traefik.io/) is a modern HTTP reverse proxy and load balancer made to deploy microservices with ease. It supports several backends, including [Docker](https://docs.docker.com/).

Traefik [global configuration](http://docs.traefik.io/configuration/backends/docker/) is managed in a [.toml file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/traefik/traefik.toml), located at /etc/traefik/traefik.toml in the container (also see this [sample file](https://github.com/containous/traefik/blob/master/traefik.sample.toml)). However, it is possible to override default behaviour [on containers](http://docs.traefik.io/configuration/backends/docker/#on-containers), or even [on services](http://docs.traefik.io/configuration/backends/docker/#on-service).

#### Global configuration
For convenience, most of the global configuration is managed in the [compose file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose.yml), in the `command` section of `traefik`:

| Setting | Description | Value |
| --- | --- | --- |
| `docker` | Enable Docker configuration backend | N.A. |
| `docker.swarmmode` | Enable swarm mode on Træfik | true |
| `docker.endpoint` | Docker server endpoint: can be a tcp or a unix socket endpoint | unix:///var/run/docker.sock |
| `docker.domain` | Default domain used | ${DOMAIN} |
| `docker.watch` | Enable watch docker changes | true |
| `web` | Activate the webUI on port 8080 | N.A. |
| `debug` | Enable debug mode | true |
| `logLevel` | Log level | ERROR |

The configuration of entry points is handled separately, in a [.toml file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/traefik/traefik.toml). By default, two entry points are provided: `http` on port 80 and `https` on port 443. Links to guides on [entry points](https://docs.traefik.io/configuration/entrypoints/) and [TLS certificate setup](https://docs.traefik.io/configuration/acme/) are provided inside the file.

#### Service configuration
All service-specific configurations are also managed in the [compose file](https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose.yml), using container *labels* in the `deploy` section of every service.

Here follows the list of labels with short descriptions:

| Label | Description |
| --- | --- |
| `traefik.backend` | Give a name to the generated backend for this container |
| `traefik.backend.loadbalancer.method` | Set the load balancer algorithm |
| `traefik.backend.loadbalancer.sticky` | Enable backend sticky sessions |
| `traefik.backend.loadbalancer.swarm` | Use Swarm's inbuilt load balancer |
| `traefik.backend.circuitbreaker.expression` | Create a circuit breaker to be used against the backend, preventing high loads on failing servers |
| `traefik.port` | Register this port: useful when the container exposes multiples ports |
| `traefik.enable` | Enable this container in Traefik |
| `traefik.frontend.rule` | Override the default frontend rule |
| `traefik.frontend.passHostHeader` | Forward client Host header to the backend |
| `traefik.frontend.entryPoints` | Assign this frontend to entry points |
| `traefik.docker.network` | Set the docker network to use for connections to this container |

Here follows the list of labels with values for services that are enabled in Traefik:

| Label | Monasca Log API | Elasticsearch | Kibana |
| --- | --- | --- | --- |
| `traefik.backend` | monasca-log-api | elasticsearch | kibana |
| `traefik.backend.loadbalancer.method` | wrr | wrr | wrr |
| `traefik.backend.loadbalancer.sticky` | N.A. (default: false) | false | true |
| `traefik.backend.loadbalancer.swarm` | false | false | false |
| `traefik.backend.circuitbreaker.expression` | N.A. | NetworkErrorRatio() > 0.5 | NetworkErrorRatio() > 0.5 |
| `traefik.port` | 8090 | 9200 | 5601 |
| `traefik.enable` | true | true | true |
| `traefik.frontend.rule` | Host:${DOMAIN}; | Host:elastic.${DOMAIN} | Host:kibana.${DOMAIN} |
|| Method:POST; |||
|| PathPrefix:/v3.0 |||
| `traefik.frontend.passHostHeader` | false | false | false |
| `traefik.frontend.entryPoints` | http,https | http,https | http,https |
| `traefik.docker.network` | backend | backend | backend |
