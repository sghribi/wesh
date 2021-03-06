angular.module '%module%.core'
.controller 'HomepageCtrl', ($scope, storage, $rootScope, $cordovaFacebook, $state, $http, $cordovaToast, $ionicPopup) ->
  $scope.user = storage.user
  $scope.disabled = false

  $scope.logout = ->
    delete storage.user
    # @TODO: unregister from ionic push
    $cordovaFacebook.logout()
    .then ->
      $state.go 'login'

  $rootScope.$on 'notification', (event, args) ->
    $ionicPopup.alert
      title: 'Wesh!',
      template: 'Un de vos amis vous dit bonjour !'

  $scope.wesh = ->
    $scope.disabled = true
    $http
      method: 'POST'
      url: 'http://ghribi.net:3000/push/' + storage.user.id #@TODO securize and restify this...
    .then ->
      $scope.disabled = false
      $cordovaToast.show 'Wesh envoyé!', 'short', 'bottom'
    , ->
      # Error
      $scope.disabled = false
