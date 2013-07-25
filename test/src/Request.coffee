chai = require 'chai'
chai.should()
expect = chai.expect

Request = require '../../src/Request'

describe 'Request', ->
  describe '#example', ->
    it 'should record the example and be chainable', ->
      request = new Request()
      .example('apple')
      .example('orange')
      .example('banana')
      request.examples[0].should.equal 'apple'
      request.examples[1].should.equal 'orange'
      request.examples[2].should.equal 'banana'
