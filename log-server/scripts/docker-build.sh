#!/bin/bash
cd $(dirname $0) && cd .. && \

docker build -t monasca-log-api monasca-log-api && \
docker build -t log-transformer log-transformer && \
docker build -t log-persister log-persister && \

docker pull zookeeper:3.3 && \
docker pull monasca/kafka:0.9.0.1-2.11 && \
docker pull docker.elastic.co/elasticsearch/elasticsearch:5.4.0 && \
docker pull docker.elastic.co/kibana/kibana:5.4.0 && \

docker pull mysql:5.5 && \
docker pull monasca/mysql-init:1.0.0 && \
docker pull monasca/keystone:1.0.6
