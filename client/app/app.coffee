'use strict'

angular.module 'latteApp', [
	'ngCookies',
	'ngResource',
	'ngSanitize',
	'btford.socket-io',
	'ui.router',
	'ui.bootstrap',
	'restangular'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider, RestangularProvider) ->
	$urlRouterProvider
	.otherwise '/'

	$locationProvider.html5Mode true
	$httpProvider.interceptors.push 'authInterceptor'
	RestangularProvider.setBaseUrl('/api');
.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
	# Add authorization token to headers
	request: (config) ->
		config.headers = config.headers or {}
		config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
		config

	# Intercept 401s and redirect you to login
	responseError: (response) ->
		if response.status is 401
			$location.path '/login'
			# remove any stale tokens
			$cookieStore.remove 'token'

		$q.reject response

.run ($rootScope, $location, Auth) ->
	# Redirect to login if route requires auth and you're not logged in
	$rootScope.$on '$stateChangeStart', (event, next) ->
		Auth.isLoggedInAsync (loggedIn) ->
			$location.path "/login" if next.authenticate and not loggedIn
