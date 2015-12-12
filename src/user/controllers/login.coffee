angular.module '%module%.user'
.controller 'LoginCtrl', ($scope, $cordovaFacebook, $state, storage, PushManager) ->

  $scope.login = ->
    $cordovaFacebook.login ['public_profile', 'email']
    .then (success) ->
      $cordovaFacebook.api('me', ['public_profile'])
      .then (success) ->
        storage.user = success
        PushManager.register()
        $state.go 'homepage'
      , (error) ->
        alert 'Facebook login error!'
    , (error) ->
      alert 'Facebook login error!'
