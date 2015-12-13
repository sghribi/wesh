angular.module '%module%.user'
.controller 'LoginCtrl', ($scope, $cordovaFacebook, $state, storage, PushManager, $http) ->

  $scope.login = ->

    # Add error handling...
    $cordovaFacebook.login ['public_profile', 'email']
    .then (success) ->
      $cordovaFacebook.api('me', ['public_profile'])
      .then (success) ->
        $http
          method: 'POST'
          url: 'http://ghribi.net:3000/register/' + success.id
        storage.user = success
        PushManager.register()
        $state.go 'homepage'
      , (error) ->
        alert 'Facebook login error!'
    , (error) ->
      alert 'Facebook login error!'
