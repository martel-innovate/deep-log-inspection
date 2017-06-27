
PROJECT_ROOT=$(git rev-parse --show-toplevel) && \
cd $PROJECT_ROOT/log-server && mkdir -p certbot
cd certbot

docker run --rm -p 80:80 -p 443:443 --name certbot \
    -v "$PWD/etc/letsencrypt:/etc/letsencrypt" \
    -v "$PWD/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "$PWD/var/log/letsencrypt:/var/log/letsencrypt" \
    certbot/certbot certonly --standalone --non-interactive --agree-tos \
        --email michele.chersich@martel-innovate.com \
        --preferred-challenges http \
        -d myDNSname.com
