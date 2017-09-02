#!/bin/bash
curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os

curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os-nova-api-osapi_compute
curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os-nova-api-metadata
curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os-nova-compute

curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os-neutron-server

curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os-cinder-api

curl -XDELETE elastic.${DOMAIN:-localhost}/_template/os-keystone-api
