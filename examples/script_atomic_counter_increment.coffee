{client, type, index, url, Q, path, id, body} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log 'increment a counter'
    body =
      script:
        # set couner + 1, start from 0 if it does not exist in the document yet
        inline: "ctx._source.counter = (ctx._source.counter ? ctx._source.counter : 0) + 1"
        params:
          count: 1
    console.log 'update', yield client.update({index, type, id, body, retry_on_conflict: 99 })
    # console.log 'update', yield client.update({index, type, id, body, retry_on_conflict: 99 })
    # console.log 'item', yield client.get({index, type, id})
  catch e
    console.log 'ERROR'
    console.log e
