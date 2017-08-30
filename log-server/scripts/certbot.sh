#!/bin/bash
# request SSL certificate
certbot certonly \
        --standalone \
        --non-interactive \
        --agree-tos \
        --renew-by-default \
        --email michele.chersich@martel-innovate.com \
        --preferred-challenges http \
        --domain deeplogmanager.lab.fiware.org && \

# automate certificate renewal
cd $(dirname $0) && \
cp certbot-renew /etc/cron.daily/ && \
chmod 755 /etc/cron.weekly/certbot-renew
