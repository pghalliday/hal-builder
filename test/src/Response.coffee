chai = require 'chai'
chai.should()
expect = chai.expect

Response = require '../../src/Response'

describe 'Response', ->
  it 'should record the response name', ->
    response = new Response
      name: 'my response'
    response.name.should.equal 'my response'

  it 'should throw an error if no name is specified', ->
    expect ->
      response = new Response()
    .to.throw 'Must specify the response name'

  describe '#link', ->
    it 'should record the link and be chainable', ->
      response = new Response
        name: 'my response'
      .link('apple')
      .link('orange')
      .link('banana')
      response.links[0].should.equal 'apple'
      response.links[1].should.equal 'orange'
      response.links[2].should.equal 'banana'

  describe '#example', ->
    it 'should record the example and be chainable', ->
      response = new Response
        name: 'my response'
      .example('apple')
      .example('orange')
      .example('banana')
      response.examples[0].should.equal 'apple'
      response.examples[1].should.equal 'orange'
      response.examples[2].should.equal 'banana'
