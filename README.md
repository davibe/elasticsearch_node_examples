
Structure

- `common`: contains definitions that are common to every example
- `runner`: runs the examples with specific order and saves ES client traces
- `examples/*coffee`: the running examples
- `exampels/*txt`: the ES client traces of the examples

Each _trace_ includes shows detailed informations about the query payloads i.e.

    {
      "method": "POST",
      "url": "http://192.168.99.100:9200/elasticsearch_nodejs_examples/elasticsearch_nodejs_examples/_mget",
      "body": { <---- body of the HTTP REQUEST
        "ids": [
          1,
          "__non__existent__"
        ]
      },
      "status": 200,
      "response": { <---- body of the HTTP RESPONSE
        "docs": [
          {
            "_index": "elasticsearch_nodejs_examples",
            "_type": "elasticsearch_nodejs_examples",
            "_id": "1",
            "_version": 1,
            "found": true,
            "_source": {
              "foo": "bar",
              "full": [
                "something"
              ],
              "empty": []
            }
          },
          {
            "_index": "elasticsearch_nodejs_examples",
            "_type": "elasticsearch_nodejs_examples",
            "_id": "__non__existent__",
            "found": false
          }
        ]
      }
    }