#!/bin/bash
curl -XDELETE localhost:9200/_template/os

curl -XDELETE localhost:9200/_template/os-nova-api-osapi_compute
curl -XDELETE localhost:9200/_template/os-nova-api-metadata
curl -XDELETE localhost:9200/_template/os-nova-compute

curl -XDELETE localhost:9200/_template/os-neutron-server

curl -XDELETE localhost:9200/_template/os-cinder-api

curl -XDELETE localhost:9200/_template/os-keystone-api
