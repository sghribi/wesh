angular.module '%module%.core'
.controller 'HomepageCtrl', ($scope, storage, $rootScope, $cordovaFacebook, $state, PushManager) ->
  $scope.user = storage.user

  $scope.logout = ->
    delete storage.user
    # @TODO: unregister from ionic push
    $cordovaFacebook.logout()
    .then ->
      $state.go 'login'

  $rootScope.$on 'notification', (event, args) ->
    alert JSON.stringify args
