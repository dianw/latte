'use strict'

angular.module 'latteApp'
.factory 'MainService', (Restangular) ->
	Restangular.service 'things'
