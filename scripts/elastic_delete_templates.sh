
curl -XGET --retry 999 --retry-max-time 0 localhost:9200/_template?pretty && \

curl -XDELETE localhost:9200/_template/os
curl -XDELETE localhost:9200/_template/os-nova-api-osapi_compute
curl -XDELETE localhost:9200/_template/os-nova-api-metadata
curl -XDELETE localhost:9200/_template/os-nova-compute-short
curl -XDELETE localhost:9200/_template/os-nova-compute-long
curl -XDELETE localhost:9200/_template/os-neutron-api
curl -XDELETE localhost:9200/_template/os-cinder-api
curl -XDELETE localhost:9200/_template/os-keystone-api
