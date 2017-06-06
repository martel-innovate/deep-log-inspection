## Elasticsearch API queries
Indexing, storing and retrieving the logs in the Deep Log Inspection system is achieved by means of the Elasticsearch backend. The access to indices, mappings and documents is possible via its REST API (for a complete reference visit [the Elasticsearch Reference guide][1]). Indices are patterns under which documents are grouped and made searchable; mappings are used to associate fields with data types; documents are individual storage entries, each corresponding to a log event.

As the Deep Log Inspection system receives the logs from outside via Monasca Log API, it is not so useful from the user's perspective to explore how to send logs. However, the user should know e.g. how to query Elasticsearch's API for existing indices, for documents matching a certain index, and even for mappings inside documents.

The [cat APIs][2] are a powerful querying tool, useful for finding relationships in the data and getting useful information from the Elasticsearch cluster.

Here follow a few example queries using `curl`. Elasticsearch's REST API should be listening at `localhost:9200`.

For a newcomer that wants to retrieve documents from Elasticsearch, the first step should be querying the existing indices. This can be done with a `GET` request to the `cat indices` API endpoint:

    curl localhost:9200/_cat/indices

Once the existing indices are known, documents matching an index can be queried via [search API][3]. Note that indices can be matched exactly, i.e. by name, or multiple indices can be queried using [wildcards][4].

The most simple query matches all documents. If e.g. the index pattern is `os-nova-*` (i.e. all indices that start with `os-nova-`), then:

    curl localhost:9200/os-nova-*/_search -d \
    '{
        "query": {
            "match_all": {}
        }
    }'

This query will return all documents whose index matches the index pattern.

Querying a particular index is useful to view relevant information about it, like mappings and settings.

    curl localhost:9200/os-nova-*

More details on querying an index are [here][5].

[1]:https://www.elastic.co/guide/en/elasticsearch/reference/5.x/index.html
[2]:https://www.elastic.co/guide/en/elasticsearch/reference/5.x/cat.html
[3]:https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-query.html
[4]:https://www.elastic.co/guide/en/elasticsearch/reference/5.x/multi-index.html
[5]:https://www.elastic.co/guide/en/elasticsearch/reference/5.x/indices-get-index.html
