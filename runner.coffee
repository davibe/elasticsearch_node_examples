
{client, type, index, url, Q}  = require './common'
fs = require 'fs'

run = (filename) -> Q.genrun ->
  # log the elasticsearch client trace object to file
  client.transport.log.once 'trace', (o) ->
    o.response = JSON.parse o.response if o.response
    o.body = JSON.parse o.body if o.body
    fs.writeFileSync("./examples/#{filename}_output.txt", JSON.stringify(o, null, 2))
  yield require("./examples/#{filename}")()

Q.genrun ->
  yield run 'delete_index'
  yield run 'create_index'
  yield run 'index'
  yield run 'get'
  yield run 'mget'
  yield client.indices.refresh({index, type}) # index needs to be refreshed in order to find stuff
  yield run 'search_empty_array'


.catch (e) ->
  console.error e, e.stack.split('\n')
