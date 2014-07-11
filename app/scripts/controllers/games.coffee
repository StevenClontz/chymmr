'use strict'

angular.module('chmmyrApp')
  .controller('GamesGetCtrl', ['$scope', 'Firebase', '$stateParams', ($scope, Firebase, $stateParams) ->

    $scope.game = Firebase.game($stateParams.id).public()

  ])
  .controller('GamesGetEditCtrl', ['$scope', 'Firebase', '$stateParams', ($scope, Firebase, $stateParams) ->

    admins = Firebase.game($stateParams.id).admins($stateParams.secretKey)
    admins.$child(Firebase.user().uid).$set(true)
  ])
