FROM logstash:2.3

RUN logstash-plugin install logstash-output-monasca_log_api

CMD ["-f", "/etc/logstash/conf.d/"]

# INSTRUCTIONS
# to build the docker image run the following command:
#
# docker build -t monasca-log-agent /home/ubuntu/monasca-log-agent
#
# then, execute the following command to run the image inside a container:
#
# docker run -d --name=monasca-log-agent -v /home/ubuntu/monasca-log-agent/config/logstash.conf:/etc/logstash/conf.d/logstash.conf -p 1025:1025/udp monasca-log-agent
#
# to mount a directory into the container add e.g.: "-v /home/ubuntu/input-syslog:/syslog"
