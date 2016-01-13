{client, type, index, url, Q, path} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log "search with query (obj with empty array)"
    body =
      query:
        missing:
          field: "empty"
    yield client.search({index, type, body})
  catch e
    if e.status = 400 then console.log 'query_parsing_exception'
    throw e
