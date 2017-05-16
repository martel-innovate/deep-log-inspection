# total count of documents in elasticsearch
curl localhost:9200/_cat/indices?v | awk '{if ($5 == "5") sum += $7;} END {print sum}'
