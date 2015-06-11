'use strict'

scope = require '../resources/message_resources'

angular.module('ngChatApp')
  .controller 'ManageCtrl', ["$scope", ($scope)->
    $scope.users = scope().users
  ]