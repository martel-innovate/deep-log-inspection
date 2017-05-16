FROM alpine:3.5

ARG API_REPO=https://github.com/openstack/monasca-log-api.git
ARG API_BRANCH=master

ARG REBUILD=1

ENV CONFIG_TEMPLATE=true \
	LOG_LEVEL_ROOT=WARN \
	LOG_LEVEL_CONSOLE=INFO \
	API_PORT=8090 \
	KAFKA_URI=kafka:9092 \
	KEYSTONE_IDENTITY_URI=http://keystone:35357 \
	KEYSTONE_AUTH_URI=http://keystone:5000 \
	KEYSTONE_ADMIN_USER=admin \
	KEYSTONE_ADMIN_PASSWORD=secretadmin \
	KEYSTONE_ADMIN_TENANT=admin

RUN apk add --no-cache python py2-pip py2-jinja2 && \
	apk add --no-cache --virtual build-dep \
		python-dev git make g++ linux-headers && \
	git clone \
		--single-branch --depth=1 -b $API_BRANCH \
    	$API_REPO /monasca-log-api && \
    pip install gunicorn && \
    cd /monasca-log-api && \
    pip install -r requirements.txt && \
	python setup.py install && \
	cd / && \
	rm -rf /monasca-log-api && \
	apk del build-dep

COPY log-api-* /etc/monasca/
COPY template.py start.sh /

EXPOSE 8090

# HEALTHCHECK --interval=10s --timeout=5s \
# CMD wget -q http://monasca-log:8090 -O - > /dev/null

CMD ["/start.sh"]
