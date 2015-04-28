'use strict'

describe 'Controller: ExpenseCtrl', ->

  # load the controller's module
  beforeEach module 'latteApp'
  ExpenseCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ExpenseCtrl = $controller 'ExpenseCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
