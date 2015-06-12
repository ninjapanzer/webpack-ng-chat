'use strict'

scope = require '../resources/message_resources'
module.exports = angular.module('ngChatApp')
  .controller 'ManageController', ["$scope", ($scope)->
    $scope.users = scope().users
  ]