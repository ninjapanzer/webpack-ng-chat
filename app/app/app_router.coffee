'use strict'

$inject = ['$routeProvider']

RouterConfig = ($routeProvider)->
  $routeProvider
    .when('/',
      template: require '../views/interaction.html'
      controller: 'InteractionController')
    .when('/manage',
      template: require '../views/manage.html'
      controller: 'ManageController')
    .otherwise redirectTo: '/'

  RouterConfig.$inject = $inject;

manage = require '../controllers/manage_ctrl'
interaction = require '../controllers/interaction_ctrl'

module.exports = RouterConfig
