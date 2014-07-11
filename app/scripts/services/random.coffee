'use strict'

angular.module('chmmyrApp')
  .factory('Random', ->
    {
      int: (lower, upper) ->
        [lower, upper] = [0, lower]     unless upper?
        [lower, upper] = [upper, lower] if lower > upper
        Math.floor(Math.random() * (upper - lower + 1) + lower)

      intStr: (lower, upper) ->
        @int(lower, upper).toString()

      baseInt: (base, length, exact=true) ->
        @int(Math.pow(base,length),Math.pow(base,length+1)-1) if exact
        @int(0,Math.pow(base,length+1)-1)

      toStr: (int, base) ->
        int.toString(base).toUpperCase()

      hexStr: (length) ->
        @toStr(@baseInt(16, length), 16)

      alphaNumStr: (length) ->
        @toStr(@baseInt(36, length), 36)

    }
  )
