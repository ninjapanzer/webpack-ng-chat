'use-strict'

angular.module('ngChatApp').factory 'User', [
  '$resource'
  ($resource) ->
    $resource 'https://elymu-api.herokuapp.com/users/:id', { callback: 'JSON_CALLBACK' }, query:
      method: 'JSONP'
      isArray: true
]
angular.module('ngChatApp').factory 'Interaction', [
  '$resource'
  ($resource) ->
    $resource 'https://elymu-api.herokuapp.com/users/:uid/interactions', { callback: 'JSON_CALLBACK' }, query:
      method: 'JSONP'
      isArray: true
]
angular.module('ngChatApp').factory 'Message', [
  '$resource'
  ($resource) ->
    $resource 'https://elymu-api.herokuapp.com/threads/:tid/messages', { callback: 'JSON_CALLBACK' }, query:
      method: 'JSONP'
      isArray: true
]
angular.module('ngChatApp').factory 'Thread', [
  '$resource'
  ($resource) ->
    $resource 'https://elymu-api.herokuapp.com/interactions/:iid/threads', { callback: 'JSON_CALLBACK' }, query:
      method: 'JSONP'
      isArray: true
]

module.exports = ->
  $scope = {}
  User.query (data) ->
    uid = data[0].id
    $scope.users = do (data) ->
      users = []
      i = 0
      while i < data.length
        users[data[i].id] = data[i]
        i++
      users
    $scope.user = data[0]
    Interaction.query { uid: uid }, (data) ->
      console.log data
      $scope.user.interactions = data
      i = 0
      while i < data.length
        iid = $scope.user.interactions[i].id
        $scope.user.interactions[i].recipient = $scope.users[$scope.user.interactions[i].recipientId]
        pos = i
        Thread.query { iid: iid }, (data) ->
          $scope.user.interactions[pos].threads = data
          j = 0
          while j < data.length
            tpos = j
            tid = $scope.user.interactions[pos].threads[j].id
            Message.query { tid: tid }, (data) ->
              $scope.user.interactions[pos].threads[tpos].messages = data
              g = 0
              while g < data.length
                $scope.user.interactions[pos].threads[tpos].messages[g].recipient = $scope.users[$scope.user.interactions[pos].threads[tpos].messages[g].recipientId]
                g++
            j++
        i++
  $scope

