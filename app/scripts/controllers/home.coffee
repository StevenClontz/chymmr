'use strict'

angular.module('chmmyrApp')
  .controller('HomeCtrl', ['$scope', '$firebase', '$state', ($scope, $firebase, $state) ->

    randomInt = (lower, upper) ->
      [lower, upper] = [0, lower]     unless upper?           # Called with one argument
      [lower, upper] = [upper, lower] if lower > upper        # Lower must be less then upper
      Math.floor(Math.random() * (upper - lower + 1) + lower) # Last statement is a return value

    ref = new Firebase("https://chmmyr.firebaseio.com/")

    auth = new FirebaseSimpleLogin(ref, (error, user) ->
      if user
        console.log 'logged in as', user
        $scope.user = user
        $scope.newGame =
          name: "New Game"
          id: randomInt(Math.pow(36,8),Math.pow(36,9)-1).toString(36).toUpperCase()
          secretKey: randomInt(Math.pow(36,8),Math.pow(36,9)-1).toString(36).toUpperCase()
          $data: ->
            obj =
              public:
                name: @name
              key: @secretKey
              secret: {}
            obj.secret[@secretKey] = admins: {}
            obj.secret[@secretKey].admins[$scope.user.uid] = true
            return obj
          $firebase: ->
            $firebase ref.child("games/#{$scope.newGame.id}")
          $create: ->
            id = @id
            gameData = @$data()
            @$firebase().$set(gameData).then(
              () -> #success
                console.log 'saved game data', gameData
                $state.go 'games.get.show', id: id
            )
        $scope.$apply()

      if error
        console.log 'there was an error', error

      else
        console.log 'user logged out'
    )

    auth.login('anonymous')

  ])
