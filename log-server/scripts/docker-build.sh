#!/bin/bash
cd $(dirname $0) && cd .. && \

docker build -t monasca-log-api monasca-log-api
docker build -t log-transformer log-transformer
docker build -t log-persister log-persister
