cd ~/deep-log-inspection/log-server/certbot
docker run --rm -p 80:80 -p 443:443 \
    -v "$PWD/etc/letsencrypt:/etc/letsencrypt" \
    -v "$PWD/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "$PWD/var/log/letsencrypt:/var/log/letsencrypt" \
    certbot/certbot certonly --standalone --non-interactive --agree-tos \
        --email michele.chersich@martel-innovate.com \
        --preferred-challenges http \
        -d fiware-lab-211.cloudlab.zhaw.ch
