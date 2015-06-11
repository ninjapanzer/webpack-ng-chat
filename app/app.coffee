'use strict'

require './controllers/interaction_ctrl'
require './controllers/manage_ctrl'

angular.module('ngChatApp', [
  'ngAnimate'
  'ngCookies'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngTouch'
]).config ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'views/interaction.html'
    controller: 'InteractionCtrl').when('/manage',
    templateUrl: 'views/manage.html'
    controller: 'ManageCtrl').otherwise redirectTo: '/'
