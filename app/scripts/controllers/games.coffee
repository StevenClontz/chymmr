'use strict'

angular.module('chmmyrApp')
  .controller('GamesGetCtrl', ['$scope', '$firebase', '$stateParams', ($scope, $firebase, $stateParams) ->

    gameId = $stateParams.id
    ref = new Firebase("https://chmmyr.firebaseio.com/games/#{gameId}/public")

    $scope.game = $firebase(ref)

  ])
