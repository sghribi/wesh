angular.module '%module%.common'
.config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
