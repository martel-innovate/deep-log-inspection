## Installing the Monasca Log Agent
The Monasca Log Agent is supposed to run on a remote machine (or virtual machine). The logs have to be sent from FIWARE Lab Nodes to that remote machine via syslog.

To install the Log Agent, copy the [syslogVM/syslog-server](../../syslogVM/syslog-server) directory to the remote machine. Then, `cd` into it and, using [docker][1], build the image and run the container, as explained by the instructions in the [Dockerfile](../../syslogVM/syslog-server/Dockerfile). Logstash's _syslog_ input plugin will be listening for logs on port 1025 and the *monasca_log_api* output plugin will send them to the [Monasca Log API](3-monasca.md). The Logstash pipeline can be found in [config/logstash.conf](../../syslogVM/syslog-server/config/logstash.conf).

The *monasca_log_api* output plugin must authenticate to Keystone, so make sure it authenticates to the same instance as the Monasca Log API. Please refer to the Monasca Log API [configuration guide](3-monasca.md) for more details.

[1]:https://www.docker.com/
