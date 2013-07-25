chai = require 'chai'
chai.should()
expect = chai.expect

Link = require '../../src/Link'

describe 'Link', ->
  it 'should record the link relationship and description and resolve the link to the relationship documentation from the given curie', ->
    link = new Link
      curies: [
        name: 'my'
        href: '/rels/{rel}'
        templated: true
      ]
      relationship: 'my:link'
      description: 'my description'
    link.relationship.name.should.equal 'my:link'
    link.relationship.url.should.equal '/rels/link'
    link.description.should.equal 'my description'

  it 'should throw an error if curies are not specified', ->
    expect ->
      link = new Link
        relationship: 'my:link'
        description: 'my description'
    .to.throw 'Must specify the link curies'

  it 'should throw an error if no relationship is specified', ->
    expect ->
      link = new Link
        curies: [
          name: 'my'
          href: '/rels/{rel}'
          templated: true
        ]
        description: 'my description'
    .to.throw 'Must specify the link relationship'

  it 'should throw an error if no description is specified', ->
    expect ->
      link = new Link
        curies: [
          name: 'my'
          href: '/rels/{rel}'
          templated: true
        ]
        relationship: 'my:link'
    .to.throw 'Must specify the link description'

