'use strict'

angular.module('chmmyrApp')
  .controller('GamesGetCtrl', ['$scope', 'Firebase', '$stateParams', ($scope, Firebase, $stateParams) ->

    $scope.game = Firebase.game($stateParams.id).public()

  ])
