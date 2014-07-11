'use strict'

angular.module('chmmyrApp')
  .factory('Firebase', ['$firebase', '$firebaseSimpleLogin',
    ($firebase, $firebaseSimpleLogin) ->
      {
        ref: new Firebase('https://chmmyr.firebaseio.com/')

        auth: ->
          $firebaseSimpleLogin @ref.child('auth')
        login: ->
          Firebase = this
          @auth().$login('anonymous').then(
            (user) ->
              console.log 'Logged in anonymously', user
              Firebase._user = user
            , (error) ->
              console.log 'Error logging in anonymously', error
          )
        user: ->
          @_user || null

        game: (id) ->
          ref: @ref.child("games/#{id}")
          full: ->
            $firebase @ref
          public: ->
            $firebase @ref.child("public")
      }
  ])
