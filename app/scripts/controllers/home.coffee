'use strict'

angular.module('chmmyrApp')
  .controller('HomeCtrl', ['$scope', 'Firebase', '$state', 'Random',
    ($scope, Firebase, $state, Random) ->

      $scope.newGame =
        name: "New Game"
        id: Random.alphaNumStr(8)
        secretKey: Random.alphaNumStr(8)
        creator: ->
          Firebase.user()
        data: ->
          obj =
            public:
              name: @name
            key: @secretKey
            secret: {}
          obj.secret[@secretKey] = admins: {}
          obj.secret[@secretKey].admins[@creator().uid] = true
          return obj
        firebase: ->
          Firebase.game(@id).full()
        create: ->
          id = @id
          gameData = @data()
          @firebase().$set(gameData).then(
            () -> #success
              console.log 'saved game data', gameData
              $state.go 'games.get.show', id: id
          )

  ])
