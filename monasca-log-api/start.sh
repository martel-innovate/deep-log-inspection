#!/bin/sh

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

gunicorn --capture-output \
  -n monasca-log-api \
  -k eventlet \
  --worker-connections=2000 \
  --backlog=1000 \
  --paste /etc/monasca/log-api-config.ini \
  -w 9
