angular.module '%module%.common'
.run ($state, storage, $ionicPlatform, PushManager) ->

  if storage.user
    $state.go 'homepage'
  else
    $state.go 'login'

  $ionicPlatform.ready ->
    if storage.user
      PushManager.register()
