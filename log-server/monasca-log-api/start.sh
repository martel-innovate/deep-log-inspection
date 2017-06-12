#!/bin/sh

GUNICORN_WORKERS=${GUNICORN_WORKERS:-"9"}
GUNICORN_WORKER_CLASS=${GUNICORN_WORKER_CLASS:-"gevent"}
GUNICORN_WORKER_CONNECTIONS=${GUNICORN_WORKER_CONNECTIONS:-"2000"}
GUNICORN_BACKLOG=${GUNICORN_BACKLOG:-"1000"}

KAFKA_WAIT_RETRIES=${KAFKA_WAIT_RETRIES:-"24"}
KAFKA_WAIT_DELAY=${KAFKA_WAIT_DELAY:-"5"}

if [ -n "$KAFKA_WAIT_FOR_TOPICS" ]; then
  echo "Waiting for Kafka topics to become available..."
  success="false"

  for i in $(seq $KAFKA_WAIT_RETRIES); do
    python /kafka_wait_for_topics.py
    if [ $? -eq 0 ]; then
      success="true"
      break
    else
      echo "Kafka not yet ready (attempt $i of $KAFKA_WAIT_RETRIES)"
      sleep "$KAFKA_WAIT_DELAY"
    fi
  done

  if [ "$success" != "true" ]; then
    echo "Kafka failed to become ready, exiting..."
    sleep 1
    exit 1
  fi
fi

if [ "$CONFIG_TEMPLATE" = "true" ]; then
  python template.py \
    /etc/monasca/log-api-config.conf.j2 \
    /etc/monasca/log-api-config.conf

  python template.py \
    /etc/monasca/log-api-config.ini.j2 \
    /etc/monasca/log-api-config.ini

  python template.py \
    /etc/monasca/log-api-logging.conf.j2 \
    /etc/monasca/log-api-logging.conf
else
  cp /etc/monasca/log-api-config.conf.j2 /etc/monasca/log-api-config.conf
  cp /etc/monasca/log-api-config.ini.j2 /etc/monasca/log-api-config.ini
  cp /etc/monasca/log-api-logging.conf.j2 /etc/monasca/log-api-logging.conf
fi

# Needed to allow utf8 use in the Monasca Log API
export PYTHONIOENCODING=utf-8
gunicorn --capture-output \
  -n monasca-api \
  --worker-class="$GUNICORN_WORKER_CLASS" \
  --worker-connections="$GUNICORN_WORKER_CONNECTIONS" \
  --backlog=$GUNICORN_BACKLOG \
  --paste /etc/monasca/log-api-config.ini \
  -w "$GUNICORN_WORKERS"
