## Configuring Kafka
In this section we will cover only the minimal configuration aspects required for the publish-subscribe system to work properly. For more advanced settings, like the number of brokers and partitions, please refer to the [README][2] file and the [Kafka documentation][1].

As described in the [architecture outline][3], two Kafka topics are required: `monasca-log` and `logstash-log`. The first one for sending logs from the Monasca Log API to the Log Parser, and the second one for sending transformed logs from the Log Parser to the Log Persister. The topics are set using the `KAFKA_CREATE_TOPICS` environment variable in the `compose` file (`kafka` service). The numbers that follow, separated by commas, are the partitions and replicas to be used for the log messages.

In order for the system to work properly, the Monasca Log API must publish the logs to the `monasca-log` topic, and the Log Parser must subscribe to the same topic. See the input section in *logstash-transformer/pipeline/logstash.conf*:

    input {
        kafka {
            bootstrap_servers => "kafka:9092"
            topics => ["monasca-log"]
            codec => "json"
        }
    }

Similarly, the Log parser must publish to the `logstash-log` topic and the Log Persister must subscribe to the same topic. See the output section in *logstash-transformer/pipeline/logstash.conf*:

    output {
        kafka {
            bootstrap_servers => "kafka:9092"
            topic_id => "logstash-log"
            codec => "json"
        }
    }

 and the input section in *logstash-persister/pipeline/logstash.conf*:

    input {
        kafka {
            bootstrap_servers => "kafka:9092"
            topics => ["logstash-log"]
            codec => "json"
        }
    }

[1]:http://kafka.apache.org/
[2]:https://github.com/martel-innovate/deep-log-monasca-elk/blob/master/kafka/README.md
[3]:https://github.com/martel-innovate/deep-log-monasca-elk/blob/master/doc/manuals/architecture.md
