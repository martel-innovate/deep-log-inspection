#!/bin/bash
BASE_URL=https://elastic.$DOMAIN/_template

curl -XDELETE $BASE_URL/os

curl -XDELETE $BASE_URL/os-nova-api-osapi_compute
curl -XDELETE $BASE_URL/os-nova-api-metadata
curl -XDELETE $BASE_URL/os-nova-compute

curl -XDELETE $BASE_URL/os-neutron-server

curl -XDELETE $BASE_URL/os-cinder-api

curl -XDELETE $BASE_URL/os-keystone-api
