module.exports = class Request
  constructor: ->
    @examples = []

  example: (example) =>
    @examples.push example
    return @
