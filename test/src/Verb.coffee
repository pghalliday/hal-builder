chai = require 'chai'
chai.should()
expect = chai.expect

Verb = require '../../src/Verb'

describe 'Verb', ->
  it 'should record the verb name and description', ->
    verb = new Verb
      name: 'my verb'
      description: 'my description'
    verb.name.should.equal 'my verb'
    verb.description.should.equal 'my description'

  it 'should throw an error if no name is specified', ->
    expect ->
      verb = new Verb
        description: 'my description'
    .to.throw 'Must specify the verb name'

  it 'should throw an error if no description is specified', ->
    expect ->
      verb = new Verb
        name: 'my verb'
    .to.throw 'Must specify the verb description'

  describe '#response', ->
    it 'should record the response and be chainable', ->
      verb = new Verb
        name: 'my verb'
        description: 'my description'
      .response('apple')
      .response('orange')
      .response('banana')
      verb.responses[0].should.equal 'apple'
      verb.responses[1].should.equal 'orange'
      verb.responses[2].should.equal 'banana'

  describe '#setRequest', ->
    it 'should record the last request passed and be chainable', ->
      verb = new Verb
        name: 'my verb'
        description: 'my description'
      .setRequest('apple')
      .setRequest('orange')
      .setRequest('banana')
      verb.request.should.equal 'banana'

