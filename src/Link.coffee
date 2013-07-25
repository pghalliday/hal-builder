expand = (template, replace) ->
  template.replace '{rel}', replace

resolve = (curies, name) ->
  parts = name.split ':'
  if parts.length > 1
    for curie in curies
      if curie.name == parts[0]
        return expand curie.href, parts[1]

module.exports = class Link
  constructor: (params) ->
    if params && params.curies
      if params.relationship
        if params.description
          @relationship = 
            name: params.relationship
            url: resolve params.curies, params.relationship
          @description = params.description
        else
          throw new Error 'Must specify the link description'
      else
        throw new Error 'Must specify the link relationship'
    else
      throw new Error 'Must specify the link curies'
