#!/bin/bash
cd $(dirname $0)/../templates
BASE_URL=https://elastic.${DOMAIN:-localhost}/_template

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os \
    --data @os.json && \

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os-nova-api-osapi_compute \
    --data @os-nova-api-osapi_compute.json && \

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os-nova-api-metadata \
    --data @os-nova-api-metadata.json && \

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os-nova-compute \
    --data @os-nova-compute.json && \

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os-neutron-server \
    --data @os-neutron-server.json && \

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os-cinder-api \
    --data @os-cinder-api.json && \

curl -H "Content-Type: application/json" \
    -XPUT $BASE_URL/os-keystone-api \
    --data @os-keystone-api.json
