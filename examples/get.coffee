{client, type, index, url, Q, path, id, body} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log 'getting a single document by id'
    yield client.get({index, type, id})
  catch e
    if e.status == 404 then console.log 'NotFound' # when id is not there
