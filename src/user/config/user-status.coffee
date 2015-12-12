angular.module '%module%.common'
.run ($state, storage) ->

  if storage.user
    $state.go 'homepage'
  else
    $state.go 'login'
