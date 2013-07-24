chai = require 'chai'
chai.should()

HalBuilder = require '../../src'

describe 'HalBuilder', ->
  it 'should instantiate', ->
    halBuilder = new HalBuilder()