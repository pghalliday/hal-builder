module.exports = class Relationship
	constructor: (params) ->
    if params && params.name
      @name = params.name
      @verbs = []
    else
      throw new Error 'Must specify the relationship name'

  verb: (verb) =>
    @verbs.push verb
    return @
