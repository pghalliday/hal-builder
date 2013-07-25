module.exports = class Response
  constructor: (params) ->
    if params && params.name
      @name = params.name
      @links = []
      @examples = []
    else
      throw new Error 'Must specify the response name'

  link: (link) =>
    @links.push link
    return @

  example: (example) =>
    @examples.push example
    return @
