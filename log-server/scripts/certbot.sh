
docker run --rm -p 80:80 -p 443:443 --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "/var/log/letsencrypt:/var/log/letsencrypt" \
    certbot/certbot certonly \
        --standalone \
        --non-interactive \
        --agree-tos \
        --renew-by-default \
        --email michele.chersich@martel-innovate.com \
        --preferred-challenges http \
        --domain deeplogmanager.lab.fiware.org
