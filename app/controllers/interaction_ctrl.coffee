'use strict'

module.exports = angular.module('ngChatApp')
  .controller 'InteractionController', ["$scope", ($scope)->
    $scope.awesomeThings = []
  ]