#!/bin/bash
curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os

curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os-nova-api-osapi_compute
curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os-nova-api-metadata
curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os-nova-compute

curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os-neutron-server

curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os-cinder-api

curl -XDELETE elastic:martellab17@127.0.0.1:9200/_template/os-keystone-api
