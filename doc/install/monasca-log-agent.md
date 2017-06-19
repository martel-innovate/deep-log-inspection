## Syslog server
The Monasca Log Agent is supposed to run on a remote (virtual) machine: the 'syslog server'. The logs must be sent from a FIWARE Lab Nodes to the syslog server via syslog. Every FIWARE Lab Node should have its own syslog server running an instance of the Monasca Log Agent.

## Installing the Monasca Log Agent
Copy the [log-client/monasca-log-agent][2] directory to the syslog server. Then, `cd` into it and, using [docker][1], build the image and run the container, as explained by the instructions in the [Dockerfile][3]. Logstash's _syslog_ input plugin will be listening for logs on port 1025 and the *monasca_log_api* output plugin will send them to the [Monasca Log API](monasca-log-api.md). The Logstash pipeline can be found in [config/logstash.conf][4].

The *monasca_log_api* output plugin must authenticate to Keystone, so make sure it authenticates to the same instance as the Monasca Log API. Please refer to the Monasca Log API [configuration guide](monasca-log-api.md) for more details.

## Region
The Monasca Log Agent is responsible for submitting information about the region where the logs are generated. The region has to be added to the _dimensions_ array in the output section of _config/logstash.conf_:

    output {
        monasca_log_api {
            monasca_log_api_url => "http://monasca-log-api:8090/v3.0"
            keystone_api_url => "http://keystone:35357/v3"
            project_name => "mini-mon"
            username => "monasca-agent"
            password => "password"
            user_domain_name => "default"
            project_domain_name => "default"
            dimensions => [ "hostname:monasca-log-agent", "region:zurich" ]
        }
    }

In the URLs, replace `monasca-log-api` and `keystone` with valid addresses. For more details refer to the [configuration section][5] in the [documentation][6] of the *monasca_log_api* Logstash output plugin.

## Openstack syslog-rsyslog configuration
In order to forward the logs from a FIWARE Lab Node to its own syslog server, Openstack Services must send logging information to syslog. This is done by editing the configuration files of the involved services, e.g.:
* /etc/nova/nova.conf
* /etc/glance/glance-api.conf
* /etc/glance/glance-registry.conf
* /etc/cinder/cinder.conf

In each file, add these lines:

    debug = False
    use_syslog = True
    syslog_log_facility = LOG_LOCAL0

You might want to configure a separate local facility (up to eight: LOCAL0, LOCAL1, ..., LOCAL7) for each service, as this provides better isolation and more flexibility. For more information, see the [syslog documentation][8].

Then rsyslog must be configured on every service node, e.g. for Nova, create on every compute node a file named /etc/rsyslog.d/60-nova.conf with the following content:

    # prevent debug from dnsmasq with the daemon.none parameter
    *.*;auth,authpriv.none,daemon.none,local0.none -/var/log/syslog
    # include all log levels
    local0.*    @@syslog-server:1025

Replace `syslog-server` with a valid address. For more details on the whole configuration, see [Openstack's official guide][7].

[1]:https://www.docker.com/
[2]:https://github.com/martel-innovate/deep-log-inspection/tree/master/log-client/monasca-log-agent
[3]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-client/monasca-log-agent/Dockerfile
[4]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-client/monasca-log-agent/config/logstash.conf
[5]:http://www.rubydoc.info/gems/logstash-output-monasca_log_api/0.5.1#Start_logstash_output_plugin
[6]:http://www.rubydoc.info/gems/logstash-output-monasca_log_api/0.5.1
[7]:https://docs.openstack.org/admin-guide/compute-manage-logs.html
[8]:https://en.wikipedia.org/wiki/Syslog
