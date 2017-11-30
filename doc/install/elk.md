## Configuring Elasticsearch
Elasticsearch can be configured in the [compose file](../../log-server/docker-compose.yml), via environment variables ([reference guide](https://www.elastic.co/guide/en/elasticsearch/reference/5.4/important-settings.html)):

| Environment Variable | Purpose | Value |
| --- | --- | --- |
| `cluster.name` | A node can only join a cluster when it shares its cluster.name with all the other nodes in the cluster | "deeplog" |
| `bootstrap.memory_lock` | It is vitally important to the health of a node that none of the JVM is ever swapped out to disk |"true" (swapping is disabled) |
| `discovery.type` | Set the discovery module for Elasticsearch | "zen" (builtin discovery module) |
| `discovery.zen.ping.unicast.hosts` | List of address of other nodes in the cluster | "elasticsearch" (Docker's DNS resolves to Elasticsearch containers; load balancing makes sure that all containers are discovered) |
| `discovery.zen.minimum_master_nodes` | Minimum number of master-eligible nodes that must be visible in order to form a cluster | 2 |

Local Gateway ([reference guide](https://www.elastic.co/guide/en/elasticsearch/reference/5.4/modules-gateway.html)):

| Environment Variable | Purpose | Value |
| --- | --- | --- |
| `gateway.expected_nodes` | The number of (data or master) nodes that are expected to be in the cluster | 3 |
| `gateway.recover_after_nodes` | Recover as long as this many data or master nodes have joined the cluster | 2 |

X-Pack ([reference guide](https://www.elastic.co/guide/en/x-pack/5.4/index.html)):

| Environment Variable | Purpose | Value |
| --- | --- | --- |
| `xpack.security.enabled` | Enable X-Pack security | "false" |
| `xpack.monitoring.enabled` | Enable X-Pack monitoring | "false" |
| `xpack.ml.enabled` | Enable X-Pack machine learning | "false" |
| `xpack.graph.enabled` | Enable X-Pack graph | "false" |
| `xpack.watcher.enabled` | Enable X-Pack watcher | "false" |

N.B.: X-Pack can be used only by purchasing a license. By default, all its components are disabled.

## Configuring Kibana
Kibana can be configured in the [compose file](../../log-server/docker-compose.yml), via environment variables (see [Kibana settings](https://www.elastic.co/guide/en/kibana/5.4/settings.html) and [Docker environment variables](https://www.elastic.co/guide/en/kibana/5.4/_configuring_kibana_on_docker.html)):

| Environment Variable | Purpose | Value |
| --- | --- | --- |
| `SERVER_NAME` | A human-readable display name that identifies this Kibana instance | "kibana" |
| `SERVER_HOST` | This setting specifies the host of the back end server | "0.0.0.0" |
| `ELASTICSEARCH_URL` | The URL of the Elasticsearch instance to use for all your queries | "http://elasticsearch:9200" |
| `XPACK_SECURITY_ENABLED` | Enable X-Pack security | "false" |
| `XPACK_MONITORING_ENABLED` | Enable X-Pack security | "false" |
| `XPACK_ML_ENABLED` | Enable X-Pack machine learning | "false" |
| `XPACK_GRAPH_ENABLED` | Enable X-Pack graph | "false" |
| `XPACK_REPORTING_ENABLED` | Enable X-Pack watcher | "false" |
