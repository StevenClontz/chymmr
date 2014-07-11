'use strict'

angular.module('chmmyrApp')
  .controller('HomeCtrl', ['$rootScope', '$scope', 'Firebase', '$state', 'Random',
    ($rootScope, $scope, Firebase, $state, Random) ->

      $scope.newGame =
        name: "New Game"
        id: Random.alphaNumStr(8)
        secretKey: Random.alphaNumStr(8)
        data: ->
          obj =
            public:
              name: @name
            key: @secretKey
            secret: {}
          obj.secret[@secretKey] = admins: {}
          obj.secret[@secretKey].admins[$rootScope.user.uid] = true
          return obj
        firebase: ->
          Firebase.game @id
        $create: ->
          id = @id
          gameData = @data()
          @firebase().$set(gameData).then(
            () -> #success
              console.log 'saved game data', gameData
              $state.go 'games.get.show', id: id
          )

  ])
