{client, type, index, url, Q, path} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log 'deleting an index'
    yield client.indices.delete({index})
  catch e
    if e.status == 404 then console.log 'index_not_found_exception'
