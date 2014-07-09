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

      #Game states
      .state 'games',
        abstract: true
        url: '/games'
        template: '<ui-view></ui-view>'

      .state 'games.get',
        abstract: true
        url: '/:id'
        templateUrl: 'views/games/layout.html'
        controller: 'GamesGetCtrl'

      .state 'games.get.show',
        url: ''
        templateUrl: 'views/games/show.html'


      #404
      .state '404',
        url: '/404'
        templateUrl: 'views/404.html'


])