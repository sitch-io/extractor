# extractor
Extract SITCH logs from Elasticsearch

Use this tool to dump the logstash index from Elasticsearch.  Very little of
this is my own code; it's really just a wrapper around
https://github.com/taskrabbit/elasticsearch-dump.


Build:

`docker build -t extractor https://github.com/sitch-io/extractor`

Run with default Elasticsearch instance in SITCH demo environment.
Results are stored in a gzipped json file:

```
docker run \
  -it \
  --rm \
  --net=demo_sitch_elk \
  extractor | gzip > ./sitch_logs.json.gz
```

Run with options, output to stdout:
```
docker run \
  -it \
  --rm \
  --net=demo_sitch_elk \
  extractor \
    /usr/bin/elasticdump \
    --input=http://elasticsearch:9200/logstash* \
    --output=$
```

Note the use of `--net=demo_sitch_elk` in the commands above.  This is
necessary for the SITCH demo environment because Elasticsearch is only
accessible via the `demo_sitch_elk` network, which is provisioned by
docker-compose.
