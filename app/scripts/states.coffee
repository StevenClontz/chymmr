'use strict'

angular.module('chmmyrApp').config(['$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider) ->
    # For any unmatched url, redirect to /
    $urlRouterProvider.otherwise "/404"
    $stateProvider

      #Dashboard State
      .state 'home',
        url: "/"
        templateUrl: 'views/home.html'
        controller: 'HomeCtrl'

      #404
      .state '404',
        url: '/404'
        templateUrl: 'views/404.html'


])