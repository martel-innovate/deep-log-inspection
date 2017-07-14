FROM alpine:3.5

ARG API_REPO=https://github.com/openstack/monasca-log-api.git
ARG API_BRANCH=master

ARG REBUILD=1

ENV CONFIG_TEMPLATE=true \
	LOG_LEVEL_ROOT=WARN \
	LOG_LEVEL_CONSOLE=INFO \
	API_PORT=8090 \
	KAFKA_URI=kafka:9092 \
	KAFKA_WAIT_FOR_TOPICS=monasca-log,logstash-log \
	KEYSTONE_IDENTITY_URI=http://keystone:35357 \
	KEYSTONE_AUTH_URI=http://keystone:5000 \
	KEYSTONE_ADMIN_USER=monasca-log-api \
	KEYSTONE_ADMIN_PASSWORD=password \
	KEYSTONE_ADMIN_TENANT=deeplog

RUN apk add --no-cache python py2-pip py2-jinja2 && \
	apk add --no-cache --virtual build-dep \
		python-dev git make g++ linux-headers && \
	mkdir /monasca-log-api && cd /monasca-log-api && \
	git init && \
	git remote add origin $API_REPO && \
	git fetch origin $API_BRANCH && \
	git reset --hard bf5507e0163a83f7a8781fe23bffaf59bde2a23e && \
    pip install gunicorn && \
    pip install -r requirements.txt && \
	python setup.py install && \
	cd / && \
	rm -rf /monasca-log-api && \
	apk del build-dep

COPY template.py start.sh kafka_wait_for_topics.py /

CMD ["/start.sh"]
