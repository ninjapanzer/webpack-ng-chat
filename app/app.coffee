'use strict';

app = angular.module('ngChatApp', [
  'ngAnimate'
  'ngCookies'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngTouch'
]);

app.config require('./app/app_register')
app.config require('./app/app_router')

module.exports = app;
global.window.ngChatApp = app;
