## Configuring Kafka
In this section we will cover only the minimal configuration aspects required for the publish-subscribe system to work properly. For more advanced settings, like the number of brokers and partitions, please refer to the [Kafka documentation][1].

As described in the [architecture outline](../architecture.md), two Kafka topics are required: `monasca-log` and `logstash-log`. The first one for sending logs from the Monasca Log API to the Log Parser, and the second one for sending transformed logs from the Log Parser to the Log Persister. The topics are set using the `KAFKA_CREATE_TOPICS` environment variable in the [compose file][2] (service `kafka`). The numbers that follow, separated by commas, are the partitions and replicas to be used for log messages.

In order for the system to work properly, the Monasca Log API must publish the logs to the `monasca-log` topic, and the Log Parser must subscribe to the same topic. See the input section in the [Log Transformer pipeline][3]:

    input {
        kafka {
            bootstrap_servers => "kafka:9092"
            topics => ["monasca-log"]
            codec => "json"
        }
    }

Similarly, the Log Parser must publish to the `logstash-log` topic and the Log Persister must subscribe to the same topic. See the output section in the [Log Transformer pipeline][3]:

    output {
        kafka {
            bootstrap_servers => "kafka:9092"
            topic_id => "logstash-log"
            codec => "json"
        }
    }

 and the input section in the [Log Persister pipeline][4]:

    input {
        kafka {
            bootstrap_servers => "kafka:9092"
            topics => ["logstash-log"]
            codec => "json"
        }
    }

[1]:http://kafka.apache.org/
[2]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/docker-compose.yml
[3]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/log-transformer/pipeline/logstash.conf
[4]:https://github.com/martel-innovate/deep-log-inspection/blob/master/log-server/log-persister/pipeline/logstash.conf
