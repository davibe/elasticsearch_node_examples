Q = require 'q-extended'
elasticsearch = require 'elasticsearch'
path = require 'path'

url = "http://192.168.99.100:9200"
index = 'elasticsearch_nodejs_examples'
type = 'elasticsearch_nodejs_examples'
client = new elasticsearch.Client(host: url, log: 'trace', defer: -> Q.defer())

# a sample object
id = 1
body = 
    foo: "bar"
    full: ["something"]
    empty: []

module.exports = {client, type, index, url, Q, path, id, body}
