curl -H "Content-Type: application/json" \
    -XPUT localhost:9200/.kibana \
    --data '{
        "index.mapper.dynamic": true,
        "number_of_replicas": "0"
    }'
