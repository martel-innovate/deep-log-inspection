#!/bin/bash
curl -XDELETE 127.0.0.1:9200/_template/os

curl -XDELETE 127.0.0.1:9200/_template/os-nova-api-osapi_compute
curl -XDELETE 127.0.0.1:9200/_template/os-nova-api-metadata
curl -XDELETE 127.0.0.1:9200/_template/os-nova-compute

curl -XDELETE 127.0.0.1:9200/_template/os-neutron-server

curl -XDELETE 127.0.0.1:9200/_template/os-cinder-api

curl -XDELETE 127.0.0.1:9200/_template/os-keystone-api
