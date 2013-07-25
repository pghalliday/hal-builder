chai = require 'chai'
chai.should()
expect = chai.expect

Relationship = require '../../src'

describe 'Relationship', ->
  it 'should record the relationship name', ->
    relationship = new Relationship
      name: 'my relationship'
    relationship.name.should.equal 'my relationship'

  it 'should throw an error if no name is specified', ->
    expect ->
      relationship = new Relationship()
    .to.throw 'Must specify the relationship name'

  describe '#verb', ->
    it 'should record the verb and be chainable', ->
      relationship = new Relationship
        name: 'my relationship'
      .verb('apple')
      .verb('orange')
      .verb('banana')
      relationship.verbs[0].should.equal 'apple'
      relationship.verbs[1].should.equal 'orange'
      relationship.verbs[2].should.equal 'banana'
