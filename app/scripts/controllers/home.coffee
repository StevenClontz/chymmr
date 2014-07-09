'use strict'

angular.module('chmmyrApp')
  .controller('HomeCtrl', ['$scope', '$firebase', ($scope, $firebase) ->

    ref = new Firebase("https://chmmyr.firebaseio.com/")

    auth = new FirebaseSimpleLogin(ref, (error, user) ->
      if error
        console.log error
      else if user
        $scope.user = user
      else
        console.log 'user logged out'
    )
    auth.login('anonymous')

    randomInt = (lower, upper) ->
      [lower, upper] = [0, lower]     unless upper?           # Called with one argument
      [lower, upper] = [upper, lower] if lower > upper        # Lower must be less then upper
      Math.floor(Math.random() * (upper - lower + 1) + lower) # Last statement is a return value

    $scope.newGame =
      name: "New Game"
      id: String(randomInt(10000000,99999999))
      secretKey: String(randomInt(10000000,99999999))
      $data: ->
        obj =
          public:
            name: @name
          key: @secretKey
          secret: {}
        obj.secret[@secretKey] = admins: {}
        obj.secret[@secretKey].admins[$scope.user.uid] = $scope.user.uid
        return obj
      $firebase: ->
        $firebase(ref.child("games/#{$scope.newGame.id}"))
      $create: ->
        @$firebase().$set(@$data())

  ])
