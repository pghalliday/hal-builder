module.exports = class Verb
  constructor: (params) ->
    if params && params.name
      if params.description
        @name = params.name
        @description = params.description
        @responses = []
      else
        throw new Error 'Must specify the verb description'
    else
      throw new Error 'Must specify the verb name'

  response: (response) =>
    @responses.push response
    return @

  setRequest: (request) =>
    @request = request
    return @
