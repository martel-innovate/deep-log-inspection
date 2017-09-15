FROM logstash:2.3

RUN logstash-plugin install logstash-output-monasca_log_api

CMD ["-f", "/etc/logstash/conf.d/"]

# INSTRUCTIONS
# pull the image from docker hub
#
# docker pull martel/monasca-log-agent
#
# then, execute the following command to run the image inside a container:
#
# docker run -d --name=monasca-log-agent --restart on-failure -v $HOME/monasca-log-agent/logstash.conf:/etc/logstash/conf.d/logstash.conf -p 1025:1025/udp martel/monasca-log-agent
#
