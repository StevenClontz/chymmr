'use strict';

###
 * @ngdoc function
 * @name chmmyrApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the chmmyrApp
###

angular.module('chmmyrApp')
  .controller('MainCtrl', ['$scope', '$firebase', ($scope, $firebase) ->
    ref = new Firebase("https://chmmyr.firebaseio.com/")
    $scope.messages = $firebase(ref)
    $scope.userName = 'User X'
    $scope.userMsg = ''
    $scope.addMessage = ->
      $scope.messages.$add
        from: $scope.userName
        body: $scope.userMsg
      $scope.userMsg = ""
  ])
