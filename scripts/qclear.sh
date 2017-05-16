
# cd /Users/Michele/Desktop/monasca/monasca-docker/monasca-log-agent
#
# cat /dev/null > logs/nova/nova-api.log
# cat /dev/null > logs/nova/nova-compute.log
# cat /dev/null > logs/nova/nova-scheduler.log
#
# cat /dev/null > logs/neutron/neutron-server.log
#
# cat /dev/null > logs/cinder/cinder-api.log
# cat /dev/null > logs/cinder/cinder-manage.log
# cat /dev/null > logs/cinder/cinder-scheduler.log
#
# cat /dev/null > logs/keystone/keystone.log

cat /dev/null > logstash-transformer/logs/transformed.log
cat /dev/null > logstash-persister/logs/persisted.log
