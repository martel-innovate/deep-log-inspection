#!/bin/bash
curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os

curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os-nova-api-osapi_compute
curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os-nova-api-metadata
curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os-nova-compute

curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os-neutron-server

curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os-cinder-api

curl -XDELETE ${DOMAIN:-127.0.0.1}/elasticsearch/_template/os-keystone-api
