
cd /Users/Michele/Desktop/monasca/monasca-docker/templates && \

curl -XGET --retry 999 --retry-max-time 0 localhost:9200/_template?pretty && \

curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/_template/os \
    --data @os.json && \

curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/_template/os-nova-api-osapi_compute \
    --data @os-nova-api-osapi_compute.json && \

curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/_template/os-nova-api-metadata \
    --data @os-nova-api-metadata.json && \

curl -H "Content-Type: application-json" \
    -XPUT localhost:9200/_template/os-nova-compute-short \
    --data @os-nova-compute-short.json && \

curl -H "Content-Type: application-json" \
    -XPUT localhost:9200/_template/os-nova-compute-long \
    --data @os-nova-compute-long.json && \

curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/_template/os-neutron-api \
    --data @os-neutron-api.json && \

curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/_template/os-cinder-api \
    --data @os-cinder-api.json && \

curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/_template/os-keystone-api \
    --data @os-keystone-api.json
