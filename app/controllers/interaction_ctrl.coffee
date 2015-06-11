'use strict'

angular.module('ngChatApp')
  .controller 'InteractionCtrl', ["$scope", ($scope)->
    $scope.awesomeThings = []
  ]