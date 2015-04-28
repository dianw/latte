'use strict'

angular.module 'latteApp'
.config ($stateProvider) ->
  $stateProvider.state 'expense',
    url: '/expense'
    templateUrl: 'app/expense/expense.html'
    controller: 'ExpenseCtrl'
