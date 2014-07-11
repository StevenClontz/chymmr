'use strict'

angular.module('chmmyrApp')
  .controller('HomeCtrl', ['$scope', 'Firebase', '$state', 'Random',
    ($scope, Firebase, $state, Random) ->

      id = Random.alphaNumStr(8)
      secretKey = Random.alphaNumStr(8)

      $scope.newGame =
        id: id
        name: "New Game #{id}"
        secretKey: secretKey
        creator: ->
          Firebase.user()
        data: ->
          obj =
            public:
              name: @name
              id: @id
            secret:
              key: @secretKey
          obj.secret[@secretKey] = {admins: {}}
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
