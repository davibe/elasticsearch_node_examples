{client, type, index, url, Q, path, id} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log 'getting multiple document by id (second does not exsist)'
    body = ids: [id, "__non__existent__"]
    yield client.mget({index, type, body})
  catch e
    if e.status == 400 then console.log 'index_already_exists_exception'
