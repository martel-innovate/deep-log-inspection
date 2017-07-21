#!/bin/bash
# request SSL certificate
docker run --rm -p 443:443 --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "/var/log/letsencrypt:/var/log/letsencrypt" \
    certbot/certbot certonly \
        --standalone \
        --non-interactive \
        --agree-tos \
        --renew-by-default \
        --email michele.chersich@martel-innovate.com \
        --preferred-challenges tls-sni \
        --domain deeplogmanager.lab.fiware.org && \

# automate certificate renewal
cd $(dirname $0) && \
cp certbot-renew /etc/cron.daily/ && \
chmod 755 /etc/cron.daily/certbot-renew
