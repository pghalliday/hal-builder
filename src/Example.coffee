module.exports = class Example
  constructor: (params) ->
    if params && params.data
      if params.description
        @data = JSON.stringify params.data, null, 2
        @description = params.description
      else
        throw new Error 'Must specify the example description'
    else
      throw new Error 'Must specify the example data'
