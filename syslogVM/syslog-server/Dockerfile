FROM logstash:2.3

RUN logstash-plugin install logstash-output-monasca_log_api

CMD ["-f", "/etc/logstash/conf.d/"]

# INSTRUCTIONS
# to build the docker image run the following command:
#
# docker build -t syslog-server /home/ubuntu/syslog-server
#
# then, execute the following command to run the image inside a container:
#
# docker run -d --name=syslog-server -v /home/ubuntu/syslog-server/config/logstash.conf:/etc/logstash/conf.d/logstash.conf -p 1025:1025/udp syslog-server
#
# to mount a directory into the container add e.g.: "-v /home/ubuntu/input-syslog:/syslog"
