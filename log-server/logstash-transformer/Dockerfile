# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:5.4.2

RUN logstash-plugin install --version 4.1.1 logstash-input-kafka
RUN logstash-plugin install --version 4.0.4 logstash-output-kafka
