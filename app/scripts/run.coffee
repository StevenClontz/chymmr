'use strict'

angular.module('chmmyrApp')
  .run(['Firebase', '$rootScope', (Firebase, $rootScope) ->
    # login anonymously at app startup
    Firebase.login().then(
      (user) ->
        $rootScope.user = user
    )
  ])
