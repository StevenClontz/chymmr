'use strict'

angular.module('chmmyrApp')
  .factory('Firebase', ['$firebase', '$firebaseSimpleLogin',
    ($firebase, $firebaseSimpleLogin) ->
      {
        ref: new Firebase('https://chmmyr.firebaseio.com/')
        auth: ->
          $firebaseSimpleLogin @ref.child('auth')
        game: (id) ->
          $firebase @ref.child("games/#{id}")
      }
  ])
