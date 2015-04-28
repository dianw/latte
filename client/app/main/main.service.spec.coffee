'use strict'

describe 'Service: main', ->

  # load the service's module
  beforeEach module 'latteApp'

  # instantiate service
  main = undefined
  beforeEach inject (_main_) ->
    main = _main_

  it 'should do something', ->
    expect(!!main).toBe true