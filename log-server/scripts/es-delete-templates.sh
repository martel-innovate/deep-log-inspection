#!/bin/bash
curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os

curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os-nova-api-osapi_compute
curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os-nova-api-metadata
curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os-nova-compute

curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os-neutron-server

curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os-cinder-api

curl -XDELETE $ELASTIC_USER:$ELASTIC_PW@127.0.0.1:9200/_template/os-keystone-api
