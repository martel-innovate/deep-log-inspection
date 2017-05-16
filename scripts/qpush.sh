
cd /Users/Michele/Desktop/monasca/monasca-docker/monasca-log-agent

cat FIWARE_LOGS/node-1/nova/nova-api.log >> logs/nova/nova-api.log
cat FIWARE_LOGS/node-1/nova/nova-scheduler.log >> logs/nova/nova-scheduler.log
cat FIWARE_LOGS/compute_1/nova/nova-compute.log >> logs/nova/nova-compute.log

cat FIWARE_LOGS/node-1/neutron/neutron-server.log >> logs/neutron/neutron-server.log

cat FIWARE_LOGS/node-1/cinder/cinder-api.log >> logs/cinder/cinder-api.log
cat FIWARE_LOGS/node-1/cinder/cinder-manage.log >> logs/cinder/cinder-manage.log
cat FIWARE_LOGS/node-1/cinder/cinder-scheduler.log >> logs/cinder/cinder-scheduler.log

#cat FIWARE_LOGS/keystone/keystone.log.1 >> logs/keystone/keystone.log
