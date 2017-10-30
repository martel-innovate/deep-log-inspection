# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.0

COPY bin/ bin/
COPY config/ config/

# Search Guard plugin
# https://github.com/floragunncom/search-guard/wiki
RUN elasticsearch-plugin install --batch com.floragunn:search-guard-5:5.4.0-15 \
	&& chmod +x \
		plugins/search-guard-5/tools/hash.sh \
		plugins/search-guard-5/tools/sgadmin.sh

USER root
RUN	chown -R elasticsearch:elasticsearch bin/
RUN chown -R elasticsearch:elasticsearch config/
#RUN yum -y update && \
#	yum -y install apr openssl && \
#	wget -P plugins/search-guard-5/ \
#	https://bintray.com/floragunncom/netty-tcnative/download_file?file_path=netty-tcnative-openssl-1.0.2-dynamic-2.0.0.Final-fedora-linux-x86_64.jar
USER elasticsearch
