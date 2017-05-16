FROM logstash:5

RUN logstash-plugin install --version 4.1.1 logstash-input-kafka
RUN logstash-plugin install --version 4.0.4 logstash-output-kafka

EXPOSE 5500
