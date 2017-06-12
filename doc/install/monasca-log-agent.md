## Installing the Monasca Log Agent
The Monasca Log Agent is supposed to run on a remote machine (or virtual machine). The logs have to be sent from FIWARE Lab Nodes to that remote machine via syslog.

To install the Log Agent, copy the [log-client/monasca-log-agent][2] directory to the remote machine. Then, `cd` into it and, using [docker][1], build the image and run the container, as explained by the instructions in the [Dockerfile][3]. Logstash's _syslog_ input plugin will be listening for logs on port 1025 and the *monasca_log_api* output plugin will send them to the [Monasca Log API](monasca-log-api.md). The Logstash pipeline can be found in [config/logstash.conf][4].

The *monasca_log_api* output plugin must authenticate to Keystone, so make sure it authenticates to the same instance as the Monasca Log API. Please refer to the Monasca Log API [configuration guide](monasca-log-api.md) for more details.

## Region
The Monasca Log Agent is responsible for submitting information about the region where the logs are generated. The region has to be added to the _dimensions_ array in the output section of _config/logstash.conf_:

    output {
        monasca_log_api {
            monasca_log_api_url => "http://80.116.31.157:8090/v3.0"
            keystone_api_url => "http://80.116.31.157:35357/v3"
            project_name => "mini-mon"
            username => "monasca-agent"
            password => "password"
            user_domain_name => "default"
            project_domain_name => "default"
            dimensions => [ "hostname:monasca-log-agent", "region:zurich" ]
        }
    }

For more details refer to the [configuration section][5] in the [documentation][6] of the *monasca_log_api* Logstash output plugin.

[1]:https://www.docker.com/
[2]:https://github.com/martel-innovate/deep-log-inspection/tree/master/log-client/monasca-log-agent
[3]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-client/monasca-log-agent/Dockerfile
[4]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-client/monasca-log-agent/config/logstash.conf
[5]:http://www.rubydoc.info/gems/logstash-output-monasca_log_api/0.5.1#Start_logstash_output_plugin
[6]:http://www.rubydoc.info/gems/logstash-output-monasca_log_api/0.5.1
