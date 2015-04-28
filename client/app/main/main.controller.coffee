'use strict'

angular.module 'latteApp'
.controller 'MainCtrl', ($scope, MainService, socket) ->
	$scope.awesomeThings = []

	MainService.getList().then (awesomeThings) ->
		$scope.awesomeThings = awesomeThings
		socket.syncUpdates 'thing', $scope.awesomeThings

	$scope.addThing = ->
		return if $scope.newThing is ''

		MainService.post
			name: $scope.newThing

		$scope.newThing = ''

	$scope.deleteThing = (thing) ->
		MainService.one(thing._id).remove()

	$scope.$on '$destroy', ->
		socket.unsyncUpdates 'thing'
