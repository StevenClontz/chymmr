'use strict'

angular.module('chmmyrApp').config(['$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider) ->
    # For any unmatched url, redirect to /
    $urlRouterProvider.otherwise "/404"
    $stateProvider

      #Dashboard State
      .state 'home',
        url: "/"
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'

      #404
      .state '404',
        url: '/404'
        templateUrl: 'views/404.html'
        controller: ['$rootScope', ($rootScope) -> $rootScope.pageTitle= '404']


])