'use strict'

angular.module('chmmyrApp')
  .run(['Firebase', '$rootScope', (Firebase, $rootScope) ->
    # login anonymously at app startup
    Firebase.auth().$login('anonymous').then(
      (user) ->
        console.log 'Logged in anonymously', user
        $rootScope.user = user
      , (error) ->
        console.log 'Error logging in anonymously', error
    )
  ])
