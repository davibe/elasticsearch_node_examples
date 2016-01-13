{client, type, index, url, Q, path, id, body} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log 'indexing a document'
    yield client.index({index, type, id, body})
  catch e
    if e.status == 404 then console.log 'mapper_parsing_exception' # if body is not valid
