chai = require 'chai'
chai.should()
expect = chai.expect

Example = require '../../src/Example'

describe 'Example', ->
  it 'should record the description and a JSON prettified string of the data', ->
    example = new Example
      data:
        myField: 'my data'
      description: 'my description'
    example.data.should.equal '{\n  "myField": "my data"\n}'
    example.description.should.equal 'my description'

  it 'should throw an error if no data is specified', ->
    expect ->
      example = new Example
        description: 'my description'
    .to.throw 'Must specify the example data'

  it 'should throw an error if no description is specified', ->
    expect ->
      example = new Example
        data:
          myField: 'my data'
    .to.throw 'Must specify the example description'
