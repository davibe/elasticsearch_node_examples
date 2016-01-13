{client, type, index, url, Q, path} = require '../common'

module.exports = -> Q.genrun ->
  try
    console.log 'creating an index'
    yield client.indices.create({index})
  catch e
    if e.status == 400 then console.log 'index_already_exists_exception'
