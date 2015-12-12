angular.module '%module%.core'
.controller 'HomepageCtrl', ($scope, storage, $cordovaFacebook, $state) ->
  $scope.user = storage.user

  $scope.logout = ->
    delete storage.user
    $cordovaFacebook.logout()
    .then ->
      $state.go 'login'
