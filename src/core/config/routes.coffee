angular.module '%module%.core'
.config ($stateProvider) ->
  $stateProvider
  .state 'homepage',
    url: '/'
    templateUrl: 'core/views/homepage.html'
    controller: 'HomepageCtrl'
