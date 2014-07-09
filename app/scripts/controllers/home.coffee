'use strict'

angular.module('chmmyrApp')
  .controller('HomeCtrl', ['$scope', '$firebase', ($scope, $firebase) ->
    ref = new Firebase("https://chmmyr.firebaseio.com/")
    $scope.games = $firebase(ref)
    $scope.game = {name:''}
    $scope.createGame = ->
      $scope.games.$add $scope.game
  ])
