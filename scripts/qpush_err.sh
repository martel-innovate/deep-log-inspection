cd /Users/Michele/Desktop/monasca/projects/monasca-docker/monasca-log-agent

cat FIWARE_LOGS/node-1/nova/nova-api.log | grep "ERROR" >> logs/nova/nova-api.log
cat FIWARE_LOGS/node-1/nova/nova-scheduler.log | grep "ERROR" >> logs/nova/nova-scheduler.log
cat FIWARE_LOGS/compute_1/nova/nova-compute.log | grep "ERROR" >> logs/nova/nova-compute.log

cat FIWARE_LOGS/node-1/neutron/neutron-server.log | grep "ERROR" >> logs/neutron/neutron-server.log

cat FIWARE_LOGS/node-1/cinder/cinder-api.log | grep "ERROR" >> logs/cinder/cinder-api.log
cat FIWARE_LOGS/node-1/cinder/cinder-manage.log | grep "ERROR" >> logs/cinder/cinder-manage.log
cat FIWARE_LOGS/node-1/cinder/cinder-scheduler.log | grep "ERROR" >> logs/cinder/cinder-scheduler.log

cat FIWARE_LOGS/keystone/keystone.log.1 | grep "ERROR" >> logs/keystone/keystone.log
